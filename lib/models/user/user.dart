import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

import '../address/district.dart';
import '../address/province.dart';
import '../address/village.dart';
import '../address/ward.dart';
import '../role/role.dart';
part 'user.g.dart';
@CopyWith(copyWithNull: true)
@JsonSerializable(anyMap: true,includeIfNull: false)
class User {
    @JsonKey(name: "id")
    String? id;
    @JsonKey(name: "avatar")
    String? avatar;
    @JsonKey(name: "certificates")
    List<String>? certificates;
    @JsonKey(name: "phone_number")
    String? phoneNumber;
    @JsonKey(name: "full_name")
    String? fullName;
    @JsonKey(name: "is_approve")
    bool? isApprove;
    @JsonKey(name: "health_condition")
    String? healthCondition;
    @JsonKey(name: "academic_rank")
    String? academicRank;
    @JsonKey(name: "major_field")
    String? majorField;
    @JsonKey(name: "province_id")
    int? provinceId;
    @JsonKey(name: "province")
    Province? province;
    @JsonKey(name: "district_id")
    int? districtId;
    @JsonKey(name: "district")
    District? district;
    @JsonKey(name: "ward_id")
    int? wardId;
    @JsonKey(name: "ward")
    Ward? ward;
    @JsonKey(name: "village_id")
    String? villageId;
    @JsonKey(name: "village")
    Village? village;
    @JsonKey(name: "password")
    String? password;
    @JsonKey(name: "login_failed_count")
    int? loginFailedCount;
    @JsonKey(name: "is_lock")
    bool? isLock;
    @JsonKey(name: "role_id")
    String? roleId;
    @JsonKey(name: "role")
    Role? role;
    @JsonKey(name: "created_by")
    String? createdBy;
    @JsonKey(name: "created_at")
    DateTime? createdAt;
    @JsonKey(name: "updated_by")
    String? updatedBy;
    @JsonKey(name: "updated_at")
    DateTime? updatedAt;
    @JsonKey(name: "deleted_by")
    String? deletedBy;
    @JsonKey(name: "exists")
    bool? exists;

    User({
        this.id,
        this.phoneNumber,
        this.fullName,
        this.isApprove,
        this.avatar,
        this.certificates,
        this.healthCondition,
        this.academicRank,
        this.majorField,
        this.provinceId,
        this.province,
        this.districtId,
        this.district,
        this.wardId,
        this.ward,
        this.villageId,
        this.village,
        this.password,
        this.loginFailedCount,
        this.isLock,
        this.roleId,
        this.role,
        this.createdBy,
        this.createdAt,
        this.updatedBy,
        this.updatedAt,
        this.deletedBy,
    });
    factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}