
import 'package:flutter_base_architecture/api/dio_helper.dart';
import 'package:flutter_base_architecture/api/res_client.dart';
import 'package:flutter_base_architecture/preference/preference.dart';

import '../api/res_client_xtm/res_client_xtm.dart';

class Repository {
  RestClient? apiClient;
  RestClientXTM? apiClientXTM;
  Repository() {
    apiClient = RestClient(DioHelper.dioObject!);
    apiClientXTM = RestClientXTM(DioHelper.dioObject!);
  }

  String get accessToken =>  PreferenceManager.getString(PreferenceManager.KEY_ACCESS_TOKEN, "");
}
