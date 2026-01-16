import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_base_architecture/models/address/address.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ward.g.dart';

@CopyWith(copyWithNull: false)
@JsonSerializable(anyMap: true, includeIfNull: false)
class Ward extends Address{
  @JsonKey(name: "district_id")
  final int? districtId;

  Ward({
    id,
    slug,
    name,
    this.districtId,
  }) : super(id: id, slug: slug, name: name);

  factory Ward.fromJson(Map<String, dynamic> json) => _$WardFromJson(json);

  Map<String, dynamic> toJson() => _$WardToJson(this);
}
