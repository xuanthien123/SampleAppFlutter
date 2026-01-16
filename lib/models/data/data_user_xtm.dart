import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

import '../user/user.dart';
part 'data_user_xtm.g.dart';

@CopyWith(copyWithNull: true)
@JsonSerializable(anyMap: true,includeIfNull: false)
class DataUserXTM {
    @JsonKey(name: "logout")
    bool? logout;
    @JsonKey(name: "user")
    User? user;

    DataUserXTM({
        this.logout,
        this.user,
    });


    factory DataUserXTM.fromJson(Map<String, dynamic> json) => _$DataUserXTMFromJson(json);

    Map<String, dynamic> toJson() => _$DataUserXTMToJson(this);
}