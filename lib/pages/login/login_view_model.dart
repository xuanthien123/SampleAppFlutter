import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/base/base_view_model.dart';
import 'package:flutter_base_architecture/models/user/exist_account_xtm/exist_account_xtm.dart';
import 'package:flutter_base_architecture/utils/extensions.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tuple/tuple.dart';
import '../../api/global_api.dart';
import '../../enum/message_status.dart';
import '../../models/app_provider.dart';
import '../../models/data/data_user_xtm.dart';
import '../../models/user/user.dart';
import '../../models/user_xtm/user_xtm.dart';
import '../../preference/preference.dart';
import '../../repository/login_repository.dart';
import '../../widgets/widget.dart';

class LoginViewModel extends BaseViewModel {
  final LoginRepository repository;

  LoginViewModel({
    required this.repository,
  }) : super(repository);
  String phone = '';
  String password = '';
  final formKeyPhone = GlobalKey<FormState>();
  final formKeyPass = GlobalKey<FormState>();
  FocusNode focusPhoneField = FocusNode();
  FocusNode focusPasswordField = FocusNode();
  DataUserXTM dataUserXTM = DataUserXTM();
  UserXTM userXTM = UserXTM();
  ExistAccountXTM? existAccountXTM;

  // info xtm
  String phoneXTM = '';
  String passwordXTM = '';
  final formKeyPhoneXTM = GlobalKey<FormState>();
  final formKeyPassXTM = GlobalKey<FormState>();
  FocusNode focusPhoneFieldXTM = FocusNode();
  FocusNode focusPasswordFieldXTM = FocusNode();
  String? validatePassword(String? pass) {
    if (pass!.trim().isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }
    return null;
  }

  String? validatePhone(String? phoneNumber) {
    if (phoneNumber!.isEmpty) {
      return 'Vui lòng nhập số điện thoại';
    }
    return null;
  }

  bool isCheckValidate() {
    bool isValidate = true;
    if (!formKeyPass.currentState!.validate()) {
      isValidate = false;
      focusPasswordField.requestFocus();
    }
    if (!formKeyPhone.currentState!.validate()) {
      isValidate = false;
      focusPhoneField.requestFocus();
    }
    return isValidate;
  }

  // check validate xtm
  bool isCheckValidateXTM() {
    bool isValidate = true;
    if (!formKeyPassXTM.currentState!.validate()) {
      isValidate = false;
      focusPasswordFieldXTM.requestFocus();
    }
    if (!formKeyPhoneXTM.currentState!.validate()) {
      isValidate = false;
      focusPhoneFieldXTM.requestFocus();
    }
    return isValidate;
  }

  Future<void> login() async {
    setLoading = true;
    notifyListeners();

    try {
      final response = await repository.login(phone, password);

      if (response.isOk) {
        await PreferenceManager.setValue(
            PreferenceManager.KEY_ACCESS_TOKEN, response.data?.token ?? '');
        globalApi.token = response.data?.token ?? "";
        User user = response.data!.entry;
        final jsonEncodeUser = jsonEncode(user);
        globalApi.user = user;
        await PreferenceManager.setValue(
            PreferenceManager.KEY_CURRENT_USER, jsonEncodeUser);
        FlushBarUtil.showSuccess(response.message!);
      } else {
        if (response.message == "Tên đăng nhập không đúng!")
          FlushBarUtil.showError("Số điện thoại không đúng");
        else
          FlushBarUtil.showError(response.message!);
      }
    } catch (e) {
      FlushBarUtil.showError("Lỗi kết nối!");
    }
    setLoading = false;
    notifyListeners();
  }

  Future<void> loginXTM() async {
    setLoading = true;
    String uuid = PreferenceManager.getString(
            PreferenceManager.UUID_DEVICE);
    notifyListeners();
    try {
      final response = await repository.loginXTM(phoneXTM, passwordXTM, uuid);
      if (response.isOk) {
        // await PreferenceManager.setValue(
        //     PreferenceManager.KEY_ACCESS_TOKEN, response.data?.token ?? '');
        // globalApi.token = response.data?.token ?? "";
        userXTM = response.data?.entry ?? UserXTM();
        final jsonEncodeUser = jsonEncode(userXTM);
        globalApi.userXTM = userXTM;
        await PreferenceManager.setValue(
            PreferenceManager.KEY_CURRENT_USER_XTM, jsonEncodeUser);
        await checkLoginWithXTM();

        setMessage = Tuple2<MessageStatus, dynamic>(MessageStatus.Success, response.message);
      } else 
          FlushBarUtil.showError(response.message!);
    } catch (e) {
      FlushBarUtil.showError("Lỗi kết nối!");
    }
    setLoading = false;
    notifyListeners();
  }

  Future checkLoginWithXTM() async {
    final deviceId = PreferenceManager.getString(
            PreferenceManager.UUID_DEVICE);
    try {
      final response =
          await repository.checkLoginWithXTM(deviceId: deviceId);
      if (response.isOk) {
        dataUserXTM = response.data?.entry ?? DataUserXTM();
        globalApi.dataUserXTM = dataUserXTM;
        // kiểm tra login lần đầu.
        final response1 = await repository.checkExistAccountXTM(phone: dataUserXTM.user?.phoneNumber ??  '');
        if(response1.isOk) {
          existAccountXTM = response1.data?.entry ?? null;
          globalApi.existAccountXTM = existAccountXTM;
        }
      }
    } catch (e) {}
    notifyListeners();
  }

  logout(String phone) {
    repository.logout(phone);
  }
}
