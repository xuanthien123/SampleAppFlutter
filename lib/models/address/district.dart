import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_base_architecture/models/address/address.dart';
import 'package:json_annotation/json_annotation.dart';

part 'district.g.dart';

@CopyWith(copyWithNull: false)
@JsonSerializable(anyMap: true, includeIfNull: false)
class District extends Address {
  @JsonKey(name: "province_id")
  final int? provinceId;

  District({
    id,
    slug,
    name,
    this.provinceId,
  }) : super(id: id, slug: slug, name: name);

  factory District.fromJson(Map<String, dynamic> json) => _$DistrictFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictToJson(this);
}
