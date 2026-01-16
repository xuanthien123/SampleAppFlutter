import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/api/request_model/request_register/user_register.dart';
import 'package:flutter_base_architecture/base/base_view_model.dart';
import 'package:flutter_base_architecture/repository/login_repository.dart';
import 'package:flutter_base_architecture/theme/constant.dart';
import 'package:flutter_base_architecture/utils/extensions.dart';
import 'package:flutter_base_architecture/widgets/flush_bar_util.dart';
import 'package:rxdart/rxdart.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  final LoginRepository repository;
  ForgotPasswordViewModel({required this.repository}) : super(repository);

  TextEditingController phoneFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  TextEditingController rePasswordFieldController = TextEditingController();

  bool _isCheckPrivatePolicy = false;
  bool get isCheckPrivatePolicy => _isCheckPrivatePolicy;
  set isCheckPrivatePolicy(bool value) {
    _isCheckPrivatePolicy = value;
    notifyListeners();
  }

  final passwordSubject = PublishSubject<String>();
  final timerSubject = PublishSubject<int>();
  Timer? _timer;
  bool isTimeout = false;
  int _counter = 0;

  UserRegister user = UserRegister();

  void startTimer() {
    _counter = 60;
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // ignore: unnecessary_statements

      (_counter > 0) ? _counter-- : {_timer!.cancel(), isTimeout = true};
      timerSubject.add(_counter);
    });
  }
  void resetTimer() {
    startTimer();
  }

  void onChangedPassword(String value) {
    passwordSubject.add(value);
  }

  @override
  void dispose() {
    passwordSubject.close();
    timerSubject.close();
    super.dispose();
  }

  String? validateName(String? name) {
    if (name!.trim().isEmpty) {
      return 'Vui lòng nhập họ và tên';
    }
    return null;
  }

  String? validatePhone(String? phoneNumber) {
    if (phoneNumber!.isEmpty) {
      return 'Vui lòng nhập số điện thoại';
    }
    if (!phoneNumber.isValidPhone) {
      return 'Sai định dạng số điện thoại';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password!.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }
    if (!password.isValidPassword) {
      return 'Mật khẩu không hợp lệ';
    }
    return null;
  }

  String? validateRePassword(String? rePassword) {
    if (rePassword!.isEmpty) {
      return 'Vui lòng nhập lại mật khẩu';
    }
    if (passwordFieldController.text != rePasswordFieldController.text) {
      return 'Mật khẩu không giống nhau';
    }
    return null;
  }

  bool validate() {
    String? messagePassword = validatePassword(passwordFieldController.text);
    if (messagePassword != null) {
      FlushBarUtil.showMessage(message: messagePassword);
      return false;
    }
    String? messageRePassword = validatePassword(rePasswordFieldController.text);
    if (messageRePassword != null) {
      FlushBarUtil.showMessage(message: messageRePassword);
      return false;
    }
    return true;
  }

  Future<bool> forgotPassword() async {
    setLoading = true;
    notifyListeners();
    try {
      String phoneNumber = user.phoneNumber??"";
      String password = passwordFieldController.text;
      String rePassword = rePasswordFieldController.text;
      print(phoneNumber);
      print(password);
      final response = await repository.forgotPassword(phoneNumber, password, rePassword);
      setLoading = false;
      notifyListeners();
      if (response.isOk) {
        return true;
      } else {
        FlushBarUtil.showMessage(message: response.message??"");
        return false;
      }
    } catch (e) {
      FlushBarUtil.showMessage(message: "Lỗi kết nối!");
      setLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> checkPhoneNumber() async {
    setLoading = true;
    notifyListeners();
    try {
      final response = await repository.checkAccount(user.phoneNumber??"");
      setLoading = false;
      notifyListeners();
      if (response.isOk) {
        FlushBarUtil.showMessage(message: "Số điện thoại không tồn tại!");
          return false;
      } else {
        if (response.code == 400 && response.message == "Số điện thoại đã tồn tại!") {
          // await Future.delayed(const Duration(seconds: 2));
          // DO SOMETHING
          startTimer();
          return true;
        } else {
          FlushBarUtil.showMessage(message: response.message??"");
          return false;
        }
      }
    } catch (e) {
      FlushBarUtil.showError("Lỗi kết nối!");
      setLoading = false;
      notifyListeners();
      return false;
    }
  }

  String intToTimeLeft(int value) {
    int h, m, s;

    // h = value ~/ 3600;

    h = 0;

    m = ((value - h * 3600)) ~/ 60;

    s = value - (h * 3600) - (m * 60);

    // String hourLeft =
    //     h.toString().length < 2 ? "0" + h.toString() : h.toString();

    String minuteLeft =
        m.toString().length < 2 ? "0" + m.toString() : m.toString();

    String secondsLeft =
        s.toString().length < 2 ? "0" + s.toString() : s.toString();

    // String result = "$hourLeft:$minuteLeft:$secondsLeft";
    String result = "$minuteLeft:$secondsLeft";

    return result;
  }

  void notifyListen() {
    notifyListeners();
  }
}