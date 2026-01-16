import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'access_token.g.dart';

@CopyWith(copyWithNull: false)
@JsonSerializable(anyMap: true,includeIfNull: false)
class AccessToken {
  final String? accessToken;

  AccessToken({this.accessToken});

  factory AccessToken.fromJson(Map<String, dynamic> json) => _$AccessTokenFromJson(json);

  Map<String, dynamic> toJson() => _$AccessTokenToJson(this);

}