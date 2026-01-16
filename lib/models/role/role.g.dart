// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RoleCWProxy {
  Role description(String? description);

  Role id(String? id);

  Role name(String? name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Role(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Role(...).copyWith(id: 12, name: "My name")
  /// ````
  Role call({
    String? description,
    String? id,
    String? name,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRole.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRole.copyWith.fieldName(...)`
class _$RoleCWProxyImpl implements _$RoleCWProxy {
  const _$RoleCWProxyImpl(this._value);

  final Role _value;

  @override
  Role description(String? description) => this(description: description);

  @override
  Role id(String? id) => this(id: id);

  @override
  Role name(String? name) => this(name: name);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Role(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Role(...).copyWith(id: 12, name: "My name")
  /// ````
  Role call({
    Object? description = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return Role(
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
    );
  }
}

extension $RoleCopyWith on Role {
  /// Returns a callable class that can be used as follows: `instanceOfRole.copyWith(...)` or like so:`instanceOfRole.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RoleCWProxy get copyWith => _$RoleCWProxyImpl(this);

  /// Copies the object with the specific fields set to `null`. If you pass `false` as a parameter, nothing will be done and it will be ignored. Don't do it. Prefer `copyWith(field: null)` or `Role(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Role(...).copyWithNull(firstField: true, secondField: true)
  /// ````
  Role copyWithNull({
    bool description = false,
    bool id = false,
    bool name = false,
  }) {
    return Role(
      description: description == true ? null : this.description,
      id: id == true ? null : this.id,
      name: name == true ? null : this.name,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Role _$RoleFromJson(Map json) => Role(
      description: json['description'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$RoleToJson(Role instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  return val;
}
