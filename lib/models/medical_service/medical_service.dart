import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_base_architecture/models/address/district.dart';
import 'package:flutter_base_architecture/models/address/province.dart';
import 'package:flutter_base_architecture/models/address/ward.dart';
import 'package:json_annotation/json_annotation.dart';

part 'medical_service.g.dart';
@CopyWith(copyWithNull: true)
@JsonSerializable(anyMap: true,includeIfNull: false)
class MedicalService {
    @JsonKey(name: "address")
    String? address;
    @JsonKey(name: "address_branch")
    List<String>? addressBranch;
    @JsonKey(name: "close_time")
    String? closeTime;
    @JsonKey(name: "created_at")
    DateTime? createdAt;
    @JsonKey(name: "created_by")
    String? createdBy;
    @JsonKey(name: "deleted_at")
    dynamic deletedAt;
    @JsonKey(name: "deleted_by")
    String? deletedBy;
    @JsonKey(name: "description")
    String? description;
    @JsonKey(name: "district")
    District? district;
    @JsonKey(name: "district_id")
    int? districtId;
    @JsonKey(name: "id")
    String? id;
    @JsonKey(name: "images")
    List<String>? images;
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "open_time")
    String? openTime;
    @JsonKey(name: "person_represent")
    String? personRepresent;
    @JsonKey(name: "phone_number")
    String? phoneNumber;
    @JsonKey(name: "province")
    Province? province;
    @JsonKey(name: "province_id")
    int? provinceId;
    @JsonKey(name: "service_category")
    Service? serviceCategory;
    @JsonKey(name: "service_category_id")
    int? serviceCategoryId;
    @JsonKey(name: "service_feature")
    List<Service>? serviceFeature;
    @JsonKey(name: "service_feature_id")
    List<int>? serviceFeatureId;
    @JsonKey(name: "status")
    bool? status;
    @JsonKey(name: "updated_at")
    DateTime? updatedAt;
    @JsonKey(name: "updated_by")
    String? updatedBy;
    @JsonKey(name: "village_id")
    String? villageId;
    @JsonKey(name: "ward")
    Ward? ward;
    @JsonKey(name: "ward_id")
    int? wardId;

    MedicalService({
        this.address,
        this.addressBranch,
        this.closeTime,
        this.createdAt,
        this.createdBy,
        this.deletedAt,
        this.deletedBy,
        this.description,
        this.district,
        this.districtId,
        this.id,
        this.images,
        this.name,
        this.openTime,
        this.personRepresent,
        this.phoneNumber,
        this.province,
        this.provinceId,
        this.serviceCategory,
        this.serviceCategoryId,
        this.serviceFeature,
        this.serviceFeatureId,
        this.status,
        this.updatedAt,
        this.updatedBy,
        this.villageId,
        this.ward,
        this.wardId,
    });

    factory MedicalService.fromJson(Map<String, dynamic> json) => _$MedicalServiceFromJson(json);

    Map<String, dynamic> toJson() => _$MedicalServiceToJson(this);
}

@JsonSerializable()
class Service {
    @JsonKey(name: "id")
    int? id;
    @JsonKey(name: "name")
    String? name;

    Service({
        this.id,
        this.name,
    });

    factory Service.fromJson(Map<String, dynamic> json) => _$ServiceFromJson(json);

    Map<String, dynamic> toJson() => _$ServiceToJson(this);
}