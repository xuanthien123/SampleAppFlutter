import 'dart:math';

import 'package:intl/intl.dart';
import 'package:flutter_base_architecture/utils/extensions/datetime_extension.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app_config.dart';

String chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));

extension StringExtension on String {
  bool search(String query) {
    final String nonUnicode = this.toLowerCase().convertToUnsigned;
    final String nonUnicodeQuery = query.trim().toLowerCase().convertToUnsigned;
    return nonUnicode.contains(nonUnicodeQuery);
  }

  String? get extractTraceId {
    final regex = RegExp(r'[a-z0-9]+\.(?:html)$');
    try {
      return regex.stringMatch(this)?.split('.').first ?? '';
    } catch (ex) {
      print(ex);
    }
    return null;
  }

  bool get isValidUrl {
    final regex = RegExp(
        r"^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:\/?#[\]@!\$&'\(\)\*\+,;=.]+$");
    return regex.hasMatch(this);
  }

  bool get isMarvelTekLink {
    return this
        .contains(RegExp(r"^(?:http(s)?:\/\/)?[\w]*\.?htx.marveltek.dev"));
  }

  String get convertToUnsigned {
    final _vietnamese = 'aAeEoOuUiIdDyY';
    final _vietnameseRegex = <RegExp>[
      RegExp(r'à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ'),
      RegExp(r'À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ'),
      RegExp(r'è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ'),
      RegExp(r'È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ'),
      RegExp(r'ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ'),
      RegExp(r'Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ'),
      RegExp(r'ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ'),
      RegExp(r'Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ'),
      RegExp(r'ì|í|ị|ỉ|ĩ'),
      RegExp(r'Ì|Í|Ị|Ỉ|Ĩ'),
      RegExp(r'đ'),
      RegExp(r'Đ'),
      RegExp(r'ỳ|ý|ỵ|ỷ|ỹ'),
      RegExp(r'Ỳ|Ý|Ỵ|Ỷ|Ỹ')
    ];
    var result = this;
    for (var i = 0; i < _vietnamese.length; ++i) {
      result = result.replaceAll(_vietnameseRegex[i], _vietnamese[i]);
    }
    return result;
  }

  bool parseBool() {
    return this.toLowerCase() == "true";
  }

  bool get isOnlyNumber {
    RegExp regex = RegExp(r'^\d*\.?\d*$');
    return regex.hasMatch(this);
  }

  String get toUpperCaseFirst {
    if (this.length > 0) {
      return "${this[0].toUpperCase()}${this.substring(1)}";
    }
    return this;
  }

  String get hidePhoneNumber {
    var phone = this;
    for (int i = 0; i < phone.length - 3; i++) {
      phone = phone.replaceRange(i, i + 1, '*');
    }
    return phone;
  }

  String get onlyMsg => this.replaceAll(RegExp(r'.[a-z]{2}-[A-Z]{2}$'), '');

  String get removeFirstCharacterIsZero => int.parse(this).toString();

  bool get isValidEmail {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return regex.hasMatch(this);
  }

  bool get isValidPhone {
    RegExp regex = RegExp(r'^([0-9]{9,13}$)');
    return regex.hasMatch(this);
  }

  bool get isValidPassword {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*\d)(?!.*?[àáạảãâầấậẩẫăằắặẳẵÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴèéẹẻẽêềếệểễÈÉẸẺẼÊỀẾỆỂỄòóọỏõôồốộổỗơờớợởỡÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠùúụủũưừứựửữÙÚỤỦŨƯỪỨỰỬỮìíịỉĩÌÍỊỈĨđĐỳýỵỷỹỲÝỴỶỸ])(?!.*\s).{8,}$');
    return regex.hasMatch(this);
  }

  Future<void> makePhoneCall() async {
    if (await canLaunch('tel://$this')) {
      await launch('tel://$this');
    } else {
      throw 'Could not launch ${'tel:$this'}';
    }
  }

  String get removeFirstZeroInPhoneNumber {
    if (this[0].toString() == '0') {
      return this.substring(1, this.length);
    } else {
      return this;
    }
  }

  String get convertCurrency {
    if (this.length > 9) {
      return '${_toDecimal(this, 1000000000)} tỷ';
    }
    if (this.length > 6) {
      return '${_toDecimal(this, 1000000)} triệu';
    }
    if (this.length > 3) {
      return '${_toDecimal(this, 1000)} nghìn';
    }
    if (this.length > 2) {
      return '${_toDecimal(this, 100)} trăm';
    }
    return this;
  }

  String get convertDateTimeStringToString {
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ")
        .parse(this, true)
        .toLocal()
        .dateTimeToDDMMYYYY;
  }

  String _toDecimal(String number, int unit) =>
      (double.parse(number) / unit).toStringAsFixed(2);

  String get inCaps =>
      this.length > 0 ? '${this[0].toUpperCase()}${this.substring(1)}' : '';

  String get allInCaps => this.toUpperCase();

  String get capitalizeFirstOfEach => this
      .replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.inCaps)
      .join(" ");

  String? cleanupWhitespace() {
    if (this == null) {
      return null;
    }

    final pattern = RegExp('\\s+');
    return this.replaceAll(pattern, " ");
  }

  String get strConvertToMoney {
    int priceInt = int.parse(this);

    NumberFormat formatter = NumberFormat("#,###");
    String formattedPrice = formatter.format(priceInt);

    return "${formattedPrice.replaceAll(",", ".")}";
  }

  String get strIOSAppId {
    var strSplit = this.split("/");
    var strId = strSplit[strSplit.length - 1].split("?");
    return strId[0];
  }

  String get strAndroidAppId {
    var strSplit = this.split("?");
    var strId = strSplit[strSplit.length - 1].split("&");
    return strId[0].replaceAll("id=", "");
  }

  String get formatText {
    String result = "";
    String temp = this.trim();
    if (temp.isNotEmpty) {
      result += temp[0];
      for (int i = 1; i < temp.length; i++) {
        if ((temp[i] == " " &&
                temp[i - 1] == " ") ||
            (temp[i] == "\n" &&
                temp[i - 1] == "\n")) {
          continue;
        } else {
          result += temp[i];
        }
      }
    }
    return result;
  }
  Future<void> launchUrlWeb() async {
    final Uri url = Uri.parse(this);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch');
    }
  }

  // String get convertUrlLinkImage {
  //   return this.replaceAll("src=\"/uploads", "src=\"${AppConfig.baseImage}/uploads");
  // }

  // String get addUrlBaseImage {
  //   if (!this.contains("https://")) {
  //     return AppConfig.baseUrlCms + this;
  //   }
  //   return this;
  // }
}