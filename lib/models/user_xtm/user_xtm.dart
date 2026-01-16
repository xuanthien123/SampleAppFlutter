import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

import '../address/district.dart';
import '../address/province.dart';
import '../address/village.dart';
import '../address/ward.dart';
part 'user_xtm.g.dart';
@CopyWith(copyWithNull: true)
@JsonSerializable(anyMap: true,includeIfNull: false)
class UserXTM {
   @JsonKey(name: "id")
    String? id;
    @JsonKey(name: "avatar")
    String? avatar;
    @JsonKey(name: "full_name")
    String? fullName;
    @JsonKey(name: "username")
    String? username;
    @JsonKey(name: "dob")
    DateTime? dob;
    @JsonKey(name: "sex")
    String? sex;
    @JsonKey(name: "phone_number")
    String? phoneNumber;
    @JsonKey(name: "acc_status")
    int? accStatus;
    @JsonKey(name: "role_id")
    String? roleId;
    @JsonKey(name: "sub_role_id")
    String? subRoleId;
    @JsonKey(name: "role")
    dynamic? role;

    @JsonKey(name: "province_id")
    int? provinceId;
    @JsonKey(name: "district_id")
    int? districtId;
    @JsonKey(name: "ward_id")
    int? wardId;
    @JsonKey(name: "village_id")
    String? villageId;
    @JsonKey(name: "province")
    Province? province;
    @JsonKey(name: "district")
    District? district;
    @JsonKey(name: "ward")
    Ward? ward;
    @JsonKey(name: "village")
    Village? village;
    @JsonKey(name: "village_contact")
    dynamic villageContact;
    @JsonKey(name: "ward_contact")
    dynamic wardContact;
    @JsonKey(name: "officer_contact")
    dynamic officerContact;


    UserXTM({
         this.id,
         this.avatar,
         this.fullName,
         this.username,
         this.dob,
         this.sex,
         this.phoneNumber,
         this.accStatus,
         this.roleId,
         this.subRoleId,
         this.role,
      
         this.provinceId,
         this.districtId,
         this.wardId,
         this.villageId,
         this.province,
         this.district,
         this.ward,
         this.village,
         this.villageContact,
         this.wardContact,
         this.officerContact,

    });

    factory UserXTM.fromJson(Map<String, dynamic> json) => _$UserXTMFromJson(json);

    Map<String, dynamic> toJson() => _$UserXTMToJson(this);
}