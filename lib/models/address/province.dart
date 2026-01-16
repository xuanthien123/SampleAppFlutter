import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_base_architecture/models/address/address.dart';
import 'package:json_annotation/json_annotation.dart';

part 'province.g.dart';

@CopyWith(copyWithNull: false)
@JsonSerializable(anyMap: true, includeIfNull: false)
class Province extends Address {

  Province({
    id,
    slug,
    name,
  }) : super(id: id, slug: slug, name: name);

  factory Province.fromJson(Map<String, dynamic> json) => _$ProvinceFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceToJson(this);
}
