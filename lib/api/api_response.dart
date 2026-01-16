import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  T? data;
  String? message;
  int? code; //this field is given by data response from server, not httpStatusCode
  dynamic error;
  ApiResponse({this.data, this.message, this.code, this.error}) {
    // if (error is DioError) {
    //   message = ServerError.withDioError(error: error).errorMessage;
    // } else {
    //   message = error.toString();
    // }
  }

  bool get isOk => code == 200;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) fromJsonT,
  ) =>
      ApiResponse<T>(
        data: json['data'] != null ? fromJsonT(json['data']) : null,
        message: json['message'] as String,
        code: json['code'] as int,
      );
}

extension FutureExtensions<T> on Future<HttpResponse<ApiResponse<T>>> {
  Future<ApiResponse<T>> wrap() async {
    try {
      final httpResponse = await this;
      return Future.value(httpResponse.data..code = httpResponse.response.data['code']);
    } catch (error) {
      print('FutureExtensions ===================================${error.toString()}');
      print('FutureExtensions ======================================================');
      print('FutureExtensions ======================================================');
      if (error is DioError) {
        return Future.value(ApiResponse(code: error.response!.statusCode, message: error.response!.data['message']));
      } else {
        return Future.value(ApiResponse(error: error, message: error.toString()));
      }
    }
  }
}
