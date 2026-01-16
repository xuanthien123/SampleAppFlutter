import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'village.g.dart';

@CopyWith(copyWithNull: false)
@JsonSerializable(anyMap: true, includeIfNull: false)
class Village {
  String? id;
  String? name;
  int? wardId;

  Village({
    this.id,
    this.name,
    this.wardId,
  });

  factory Village.fromJson(Map<String, dynamic> json) => _$VillageFromJson(json);

  Map<String, dynamic> toJson() => _$VillageToJson(this);
}
