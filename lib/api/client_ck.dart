import 'package:dio/dio.dart';
import 'package:flutter_base_architecture/app_config.dart';

import 'handler_response.dart';
    
class ClientCK {
  static BaseOptions _options =  BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
      headers: {}
  );
  static Dio _dio = Dio(_options);

  ClientCK._internal() {
    _dio.interceptors.add(LogInterceptor(responseBody: true));
    _dio.interceptors.add(ResponseInterceptor());
  }
  static final ClientCK instance = ClientCK._internal();

  Dio get dio => _dio;
}
