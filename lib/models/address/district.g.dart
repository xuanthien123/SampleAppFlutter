// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DistrictCWProxy {
  District id(dynamic id);

  District slug(dynamic slug);

  District name(dynamic name);

  District provinceId(int? provinceId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `District(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// District(...).copyWith(id: 12, name: "My name")
  /// ````
  District call({
    dynamic id,
    dynamic slug,
    dynamic name,
    int? provinceId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDistrict.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDistrict.copyWith.fieldName(...)`
class _$DistrictCWProxyImpl implements _$DistrictCWProxy {
  const _$DistrictCWProxyImpl(this._value);

  final District _value;

  @override
  District id(dynamic id) => this(id: id);

  @override
  District slug(dynamic slug) => this(slug: slug);

  @override
  District name(dynamic name) => this(name: name);

  @override
  District provinceId(int? provinceId) => this(provinceId: provinceId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `District(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// District(...).copyWith(id: 12, name: "My name")
  /// ````
  District call({
    Object? id = const $CopyWithPlaceholder(),
    Object? slug = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? provinceId = const $CopyWithPlaceholder(),
  }) {
    return District(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as dynamic,
      slug: slug == const $CopyWithPlaceholder() || slug == null
          ? _value.slug
          // ignore: cast_nullable_to_non_nullable
          : slug as dynamic,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as dynamic,
      provinceId: provinceId == const $CopyWithPlaceholder()
          ? _value.provinceId
          // ignore: cast_nullable_to_non_nullable
          : provinceId as int?,
    );
  }
}

extension $DistrictCopyWith on District {
  /// Returns a callable class that can be used as follows: `instanceOfDistrict.copyWith(...)` or like so:`instanceOfDistrict.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DistrictCWProxy get copyWith => _$DistrictCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

District _$DistrictFromJson(Map json) => District(
      id: json['id'],
      slug: json['slug'],
      name: json['name'],
      provinceId: json['province_id'] as int?,
    );

Map<String, dynamic> _$DistrictToJson(District instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('slug', instance.slug);
  writeNotNull('province_id', instance.provinceId);
  return val;
}
