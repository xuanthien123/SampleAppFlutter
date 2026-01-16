// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProvinceCWProxy {
  Province id(dynamic id);

  Province slug(dynamic slug);

  Province name(dynamic name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Province(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Province(...).copyWith(id: 12, name: "My name")
  /// ````
  Province call({
    dynamic id,
    dynamic slug,
    dynamic name,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProvince.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProvince.copyWith.fieldName(...)`
class _$ProvinceCWProxyImpl implements _$ProvinceCWProxy {
  const _$ProvinceCWProxyImpl(this._value);

  final Province _value;

  @override
  Province id(dynamic id) => this(id: id);

  @override
  Province slug(dynamic slug) => this(slug: slug);

  @override
  Province name(dynamic name) => this(name: name);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Province(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Province(...).copyWith(id: 12, name: "My name")
  /// ````
  Province call({
    Object? id = const $CopyWithPlaceholder(),
    Object? slug = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return Province(
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
    );
  }
}

extension $ProvinceCopyWith on Province {
  /// Returns a callable class that can be used as follows: `instanceOfProvince.copyWith(...)` or like so:`instanceOfProvince.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProvinceCWProxy get copyWith => _$ProvinceCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Province _$ProvinceFromJson(Map json) => Province(
      id: json['id'],
      slug: json['slug'],
      name: json['name'],
    );

Map<String, dynamic> _$ProvinceToJson(Province instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('slug', instance.slug);
  return val;
}
