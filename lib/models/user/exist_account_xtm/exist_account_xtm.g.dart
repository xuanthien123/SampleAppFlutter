// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exist_account_xtm.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ExistAccountXTMCWProxy {
  ExistAccountXTM exists(bool? exists);

  ExistAccountXTM token(String? token);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ExistAccountXTM(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ExistAccountXTM(...).copyWith(id: 12, name: "My name")
  /// ````
  ExistAccountXTM call({
    bool? exists,
    String? token,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfExistAccountXTM.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfExistAccountXTM.copyWith.fieldName(...)`
class _$ExistAccountXTMCWProxyImpl implements _$ExistAccountXTMCWProxy {
  const _$ExistAccountXTMCWProxyImpl(this._value);

  final ExistAccountXTM _value;

  @override
  ExistAccountXTM exists(bool? exists) => this(exists: exists);

  @override
  ExistAccountXTM token(String? token) => this(token: token);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ExistAccountXTM(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ExistAccountXTM(...).copyWith(id: 12, name: "My name")
  /// ````
  ExistAccountXTM call({
    Object? exists = const $CopyWithPlaceholder(),
    Object? token = const $CopyWithPlaceholder(),
  }) {
    return ExistAccountXTM(
      exists: exists == const $CopyWithPlaceholder()
          ? _value.exists
          // ignore: cast_nullable_to_non_nullable
          : exists as bool?,
      token: token == const $CopyWithPlaceholder()
          ? _value.token
          // ignore: cast_nullable_to_non_nullable
          : token as String?,
    );
  }
}

extension $ExistAccountXTMCopyWith on ExistAccountXTM {
  /// Returns a callable class that can be used as follows: `instanceOfExistAccountXTM.copyWith(...)` or like so:`instanceOfExistAccountXTM.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ExistAccountXTMCWProxy get copyWith => _$ExistAccountXTMCWProxyImpl(this);

  /// Copies the object with the specific fields set to `null`. If you pass `false` as a parameter, nothing will be done and it will be ignored. Don't do it. Prefer `copyWith(field: null)` or `ExistAccountXTM(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ExistAccountXTM(...).copyWithNull(firstField: true, secondField: true)
  /// ````
  ExistAccountXTM copyWithNull({
    bool exists = false,
    bool token = false,
  }) {
    return ExistAccountXTM(
      exists: exists == true ? null : this.exists,
      token: token == true ? null : this.token,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExistAccountXTM _$ExistAccountXTMFromJson(Map json) => ExistAccountXTM(
      exists: json['exists'] as bool?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$ExistAccountXTMToJson(ExistAccountXTM instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('exists', instance.exists);
  writeNotNull('token', instance.token);
  return val;
}
