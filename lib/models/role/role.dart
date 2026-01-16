
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'role.g.dart';
@CopyWith(copyWithNull: true)
@JsonSerializable(anyMap: true,includeIfNull: false)
class Role {
   String? description;
    String? id;
    String? name;

    Role({
        this.description,
        this.id,
        this.name,
    });
    factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}