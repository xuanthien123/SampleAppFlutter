import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_register.g.dart';
@CopyWith(copyWithNull: false)
@JsonSerializable(anyMap: true, includeIfNull: false)
class UserRegister {
    @JsonKey(name: "full_name")
    String? fullName;
    @JsonKey(name: "phone_number")
    String? phoneNumber;
    @JsonKey(name: "role_id")
    String? roleId;
    @JsonKey(name: "province_id")
    int? provinceId;
    @JsonKey(name: "district_id")
    int? districtId;
    @JsonKey(name: "ward_id")
    int? wardId;
    @JsonKey(name: "xtm")
    bool? xtm;
    @JsonKey(name: "xtm_user_id")
    String? xtmUserId;
    @JsonKey(name: "password")
    String? password;
    @JsonKey(name: "re_password")
    String? rePassword;
    @JsonKey(name: "certificates")
    List<String>? certificates;

    UserRegister({
        this.fullName,
        this.phoneNumber,
        this.roleId,
        this.provinceId,
        this.districtId,
        this.wardId,
        this.password,
        this.rePassword,
        this.certificates,
    });

    factory UserRegister.fromJson(Map<String, dynamic> json) => _$UserRegisterFromJson(json);

    Map<String, dynamic> toJson() => _$UserRegisterToJson(this);
}