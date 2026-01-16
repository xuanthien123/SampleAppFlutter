// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'village.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VillageCWProxy {
  Village id(String? id);

  Village name(String? name);

  Village wardId(int? wardId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Village(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Village(...).copyWith(id: 12, name: "My name")
  /// ````
  Village call({
    String? id,
    String? name,
    int? wardId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVillage.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVillage.copyWith.fieldName(...)`
class _$VillageCWProxyImpl implements _$VillageCWProxy {
  const _$VillageCWProxyImpl(this._value);

  final Village _value;

  @override
  Village id(String? id) => this(id: id);

  @override
  Village name(String? name) => this(name: name);

  @override
  Village wardId(int? wardId) => this(wardId: wardId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Village(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Village(...).copyWith(id: 12, name: "My name")
  /// ````
  Village call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? wardId = const $CopyWithPlaceholder(),
  }) {
    return Village(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      wardId: wardId == const $CopyWithPlaceholder()
          ? _value.wardId
          // ignore: cast_nullable_to_non_nullable
          : wardId as int?,
    );
  }
}

extension $VillageCopyWith on Village {
  /// Returns a callable class that can be used as follows: `instanceOfVillage.copyWith(...)` or like so:`instanceOfVillage.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VillageCWProxy get copyWith => _$VillageCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Village _$VillageFromJson(Map json) => Village(
      id: json['id'] as String?,
      name: json['name'] as String?,
      wardId: json['wardId'] as int?,
    );

Map<String, dynamic> _$VillageToJson(Village instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('wardId', instance.wardId);
  return val;
}
