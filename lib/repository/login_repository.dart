import 'package:flutter_base_architecture/api/api_response.dart';
import 'package:flutter_base_architecture/api/request_model/request_register/user_register.dart';
import 'package:flutter_base_architecture/api/response_model/normal_response.dart';
import 'package:flutter_base_architecture/repository/repository.dart';

import '../api/global_api.dart';
import '../models/data/data_user_xtm.dart';
import '../models/user/exist_account_xtm/exist_account_xtm.dart';
import '../models/user/user.dart';
import '../models/user_xtm/user_xtm.dart';
import '../preference/preference.dart';

class LoginRepository extends Repository {
  Future<ApiResponse<NormalResponse<User>>> login(
      String phone, String password) async {
    return apiClient!
        .login({"phone_number": phone, "password": password}).wrap();
  }

  Future<ApiResponse<dynamic>> checkAccount(String phoneNumber) async {
    return apiClient!.checkAccount(phoneNumber: phoneNumber).wrap();
  }

  Future<ApiResponse<NormalResponse<DataUserXTM>>> checkLoginWithXTM(
      {required String deviceId}) async {
    return apiClientXTM!.checkLoginWithXTM(deviceId: deviceId).wrap();
  }

  Future<ApiResponse<NormalResponse<ExistAccountXTM>>> checkExistAccountXTM(
      {required String phone}) async {
    return apiClient!.checkExistAccountXTM(phone: phone).wrap();
  }

  Future<ApiResponse<NormalResponse<ExistAccountXTM>>> register(
      UserRegister userRegister) async {
    return apiClient!.register(userRegister: userRegister).wrap();
  }

  Future<ApiResponse<dynamic>> forgotPassword(
      String phoneNumber, String password, String rePassword) {
    return apiClient!.forgotPassword({
      "phone_number": phoneNumber,
      "password": password,
      "re_password": rePassword
    }).wrap();
  }

  // login with xtm
  Future<ApiResponse<NormalResponse<UserXTM>>> loginXTM(
      String phone, String password, String uuid) async {
    return apiClientXTM!.login({
      "phone_number": phone,
      "password": password,
      "device_id": uuid,
      "logout": false
    }).wrap();
  }
  Future<void> logout(String phone) async {

    final uuid = PreferenceManager.getString(PreferenceManager.UUID_DEVICE);
    final dataLogout = {
      "device_id": uuid,
      "phone": phone,
      "logout": true
    };
    try {
      await apiClientXTM!.logoutDevice(dataLogout);
    } catch (e) {}
  }
}
