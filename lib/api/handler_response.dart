import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'global_api.dart';


class ResponseInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
    // ignore: deprecated_member_use
    if (err.type == DioErrorType.badResponse) {
      if (err.response?.statusCode == 401) {
        globalApi.token = "";
        EasyLoading.showError(
            "Phiên đăng nhập hết hạn, vui lòng đăng nhập lại");
      }
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    super.onResponse(response, handler);
    if (response.statusCode == 401) {
      EasyLoading.showError("Phiên đăng nhập hết hạn, vui lòng đăng nhập lại");
      globalApi.token = "";
    }
  }
}
