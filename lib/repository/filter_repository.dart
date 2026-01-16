import 'package:flutter_base_architecture/api/api_response.dart';
import 'package:flutter_base_architecture/api/response_model/paging_response.dart';
import 'package:flutter_base_architecture/models/address/district.dart';
import 'package:flutter_base_architecture/models/address/province.dart';
import 'package:flutter_base_architecture/models/address/ward.dart';
import 'package:flutter_base_architecture/repository/repository.dart';


class FilterRepository extends Repository {
  Future<ApiResponse<PagingResponse<List<District>>>> getListDistrict(
      int provinceId) async {
    return apiClient!.getListDistrict(province: provinceId).wrap();
  }

  Future<ApiResponse<PagingResponse<List<Province>>>> getListProvince() async {
    return apiClient!.getListProvince().wrap();
  }

  Future<ApiResponse<PagingResponse<List<Ward>>>> getListWard(
      int districtId) async {
    return apiClient!.getListWard(district: districtId).wrap();
  }
}
