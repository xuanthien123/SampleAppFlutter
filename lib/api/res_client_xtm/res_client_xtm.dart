import 'package:dio/dio.dart';
import 'package:flutter_base_architecture/api/response_model/normal_response.dart';

import 'package:flutter_base_architecture/app_config.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/data/data_user_xtm.dart';
import '../../models/user_xtm/user_xtm.dart';
import '../api_response.dart';
part 'res_client_xtm.g.dart';

const int PageSize = 25;

@RestApi(baseUrl: AppConfig.baseUrlSmartVillage)
abstract class RestClientXTM {
  factory RestClientXTM(Dio dio, {String baseUrl}) = _RestClientXTM;

  @POST('/api/auth/login')
  Future<HttpResponse<ApiResponse<NormalResponse<UserXTM>>>> login(
    @Body() Map<String, dynamic> data,
  );

  // Kiểm tra thiết bị đang login XTM hay không?
  @GET('/api/app/manage-device/check-logout/{deviceId}')
  Future<HttpResponse<ApiResponse<NormalResponse<DataUserXTM>>>> checkLoginWithXTM({
    @Path('deviceId') required String deviceId
  });

  @PUT('/api/app/manage-device/change-logout')
  Future<HttpResponse<ApiResponse<dynamic>>> logoutDevice(
  @Body() Map<String, dynamic> data);
}
