import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@CopyWith(copyWithNull: false)
@JsonSerializable(anyMap: true, includeIfNull: false)
class LoginRequest {
  bool? remember;
  String? password;
  String? username;

  LoginRequest({this.remember = true, this.password, this.username});

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
