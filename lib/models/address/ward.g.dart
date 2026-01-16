// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ward.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WardCWProxy {
  Ward id(dynamic id);

  Ward slug(dynamic slug);

  Ward name(dynamic name);

  Ward districtId(int? districtId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Ward(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Ward(...).copyWith(id: 12, name: "My name")
  /// ````
  Ward call({
    dynamic id,
    dynamic slug,
    dynamic name,
    int? districtId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWard.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWard.copyWith.fieldName(...)`
class _$WardCWProxyImpl implements _$WardCWProxy {
  const _$WardCWProxyImpl(this._value);

  final Ward _value;

  @override
  Ward id(dynamic id) => this(id: id);

  @override
  Ward slug(dynamic slug) => this(slug: slug);

  @override
  Ward name(dynamic name) => this(name: name);

  @override
  Ward districtId(int? districtId) => this(districtId: districtId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Ward(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Ward(...).copyWith(id: 12, name: "My name")
  /// ````
  Ward call({
    Object? id = const $CopyWithPlaceholder(),
    Object? slug = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? districtId = const $CopyWithPlaceholder(),
  }) {
    return Ward(
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
      districtId: districtId == const $CopyWithPlaceholder()
          ? _value.districtId
          // ignore: cast_nullable_to_non_nullable
          : districtId as int?,
    );
  }
}

extension $WardCopyWith on Ward {
  /// Returns a callable class that can be used as follows: `instanceOfWard.copyWith(...)` or like so:`instanceOfWard.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WardCWProxy get copyWith => _$WardCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ward _$WardFromJson(Map json) => Ward(
      id: json['id'],
      slug: json['slug'],
      name: json['name'],
      districtId: json['district_id'] as int?,
    );

Map<String, dynamic> _$WardToJson(Ward instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('slug', instance.slug);
  writeNotNull('district_id', instance.districtId);
  return val;
}
