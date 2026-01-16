import 'package:dio/dio.dart';
import 'package:flutter_base_architecture/api/global_api.dart';
import 'package:flutter_base_architecture/api/request_model/request_register/user_register.dart';
import 'package:flutter_base_architecture/api/response_model/normal_response.dart';
import 'package:flutter_base_architecture/api/response_model/paging_response.dart';

import 'package:flutter_base_architecture/app_config.dart';
import 'package:flutter_base_architecture/models/address/district.dart';
import 'package:flutter_base_architecture/models/address/province.dart';
import 'package:flutter_base_architecture/models/address/ward.dart';
import 'package:flutter_base_architecture/models/reflect_comment/reflect_comment.dart';
import 'package:flutter_base_architecture/models/reflect_comment/sentiment_comment_request.dart';
import 'package:retrofit/retrofit.dart';

import '../models/user/exist_account_xtm/exist_account_xtm.dart';
import '../models/user/user.dart';
import 'api_response.dart';
part 'res_client.g.dart';

const int PageSize = 25;

@RestApi(baseUrl: AppConfig.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/api/auth/login')
  Future<HttpResponse<ApiResponse<NormalResponse<User>>>> login(
    @Body() Map<String, String> data,
  );

  @GET('/api/auth/check-phone-number/{phone}')
  Future<HttpResponse<ApiResponse<dynamic>>> checkAccount({
    @Path('phone') required String phoneNumber
  });

  @POST('/api/auth/register')
  Future<HttpResponse<ApiResponse<NormalResponse<ExistAccountXTM>>>> register({
    @Body() required UserRegister userRegister
  });

  @GET('/api/web/provinces')
  Future<HttpResponse<ApiResponse<PagingResponse<List<Province>>>>> getListProvince({
    @Query('length') int length = 200,
  });

  @GET('/api/web/districts')
  Future<HttpResponse<ApiResponse<PagingResponse<List<District>>>>> getListDistrict({
    @Query('province') required int province,
    @Query('length') int length = 200,
  });

  @GET('/api/web/wards')
  Future<HttpResponse<ApiResponse<PagingResponse<List<Ward>>>>> getListWard({
    @Query('district') required int district,
    @Query('length') int length = 200,
  });

  @PATCH('/api/auth/forget-password')
  Future<HttpResponse<ApiResponse<dynamic>>> forgotPassword(@Body() Map<String, String> map);

  // Kiểm tra tài khoản XTM đã đăng nhập lần đầu chưa?
  @GET('/api/web/xtm/get-token/{phone}')
  Future<HttpResponse<ApiResponse<NormalResponse<ExistAccountXTM>>>> checkExistAccountXTM({
    @Path('phone') required String phone
  });

  @GET("/api/admin/sentiments-comment/sentiment/{id}")
  Future<HttpResponse<ApiResponse<PagingResponse<List<ReflectComment>>>>>
      getListSentimentComment(
          {@Query('page') int? page,
          @Query('length') int? pageSize,
          @Query('search') String? search,
          @Path('id') required String sentimentId,
          @Query('result-status') int? resultStatus});

  @POST("/api/admin/sentiments-comment")
  Future<HttpResponse<ApiResponse<dynamic>>> addSentimentComment(
      {@Body() SentimentCommentRequest? request});

  @PATCH("/api/admin/sentiments-comment/{id}")
  Future<HttpResponse<ApiResponse<dynamic>>> editSentimentComment(
      {@Path() String? id, @Body() required Map<String, String?> data});

  @POST("/api/admin/sentiments-comment/comments")
  Future<HttpResponse<ApiResponse<dynamic>>> deleteMultiSentimentComment(
      {@Body() required Map<String, List<String>> data});

}
