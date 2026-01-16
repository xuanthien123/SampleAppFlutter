import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

final dateFormatter = DateFormat('dd/MM/yyyy');

final dateTimeFormmatter = DateFormat('HH:mm:ss dd/MM/yyyy');

final formatter = NumberFormat("###,###.###", "vi-VN");

const _locale = 'vi-VN';

String numberFormat(String s) =>
    NumberFormat.decimalPattern(_locale).format(int.parse(s));

bool isEmpty(var object) {
  if (object == false || object == 'false' || object == 'null' || object == 'N/A' || object == null || object == {} || object == '') {
    return true;
  }
  if (object is Iterable && object.length == 0) {
    return true;
  }
  return false;
}

String formatPhoneNumber(String phoneNumber) {
  return phoneNumber.indexOf('0') == 0 ? '84' + phoneNumber.substring(1) : phoneNumber;
}

String enumToString(Object o) => o.toString().split('.').last;

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

DateTime getDateTime(String dateTimeString) {
  DateTime datetime = DateTime.parse(dateTimeString).toLocal();
  return datetime;
}

String parseDate(String dateTimeString) {
  String result = '';
  try {
    DateTime datetime = getDateTime(dateTimeString);
    result = dateFormatter.format(datetime);
  } catch (ex) {
    debugPrint(ex.toString());
  }
  return result;
}

String parseDateTime(String dateTimeString) {
  String result = '';
  try {
    DateTime datetime = getDateTime(dateTimeString);
    result = dateTimeFormmatter.format(datetime);
  } catch (ex) {
    debugPrint(ex.toString());
  }
  return result;
}

Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
}

Color getColorFromString(String color) {
  return Color(int.parse('0xFF' + color.replaceAll('#', '')));
}
String convertTimeStampToStringDate(var millis) {
  var dt = DateTime.fromMillisecondsSinceEpoch(millis*1000);
  var date = DateFormat('dd/MM').format(dt); // 31/12/2000, 22:00
  return date;
}
String convertTimeStampToStringTime(var millis) {
  var dt = DateTime.fromMillisecondsSinceEpoch(millis*1000);
  var date = DateFormat('HH:mm').format(dt); // 31/12/2000, 22:00
  return date;
}
String convertTimeStampToStringDateTime(var millis) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  String date;

  DateTime dt = DateTime.fromMillisecondsSinceEpoch(millis*1000);

  final dateToCheck = DateTime(dt.year, dt.month, dt.day);
  if (dateToCheck == today) {
    date = DateFormat('HH:mm').format(dt) + ' Hôm nay';
  } else {
    date = DateFormat('HH:mm dd/MM/yyyy').format(dt); // 31/12/2000, 22:00
  }

  return date;
}
Size getScreenSize(){
  // get size screen not Appbar,Appbar status
  double paddingTop = MediaQuery.of(Get.context!).padding.top;
  Size screenSize = Size(MediaQuery.of(Get.context!).size.width, MediaQuery.of(Get.context!).size.height - kToolbarHeight - paddingTop);
  return screenSize;
}
