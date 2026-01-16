import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
part 'exist_account_xtm.g.dart';

@CopyWith(copyWithNull: true)
@JsonSerializable(anyMap: true,includeIfNull: false)
class ExistAccountXTM{
    @JsonKey(name: "exists")
    bool? exists;
    @JsonKey(name: "token")
    String? token;

    ExistAccountXTM({
      this.exists,
      this.token
    });
  
  factory ExistAccountXTM.fromJson(Map<String, dynamic> json) => _$ExistAccountXTMFromJson(json);
  Map<String, dynamic> toJson() => _$ExistAccountXTMToJson(this);
}