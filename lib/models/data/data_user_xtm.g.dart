// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_user_xtm.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DataUserXTMCWProxy {
  DataUserXTM logout(bool? logout);

  DataUserXTM user(User? user);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DataUserXTM(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DataUserXTM(...).copyWith(id: 12, name: "My name")
  /// ````
  DataUserXTM call({
    bool? logout,
    User? user,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDataUserXTM.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDataUserXTM.copyWith.fieldName(...)`
class _$DataUserXTMCWProxyImpl implements _$DataUserXTMCWProxy {
  const _$DataUserXTMCWProxyImpl(this._value);

  final DataUserXTM _value;

  @override
  DataUserXTM logout(bool? logout) => this(logout: logout);

  @override
  DataUserXTM user(User? user) => this(user: user);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DataUserXTM(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DataUserXTM(...).copyWith(id: 12, name: "My name")
  /// ````
  DataUserXTM call({
    Object? logout = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
  }) {
    return DataUserXTM(
      logout: logout == const $CopyWithPlaceholder()
          ? _value.logout
          // ignore: cast_nullable_to_non_nullable
          : logout as bool?,
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as User?,
    );
  }
}

extension $DataUserXTMCopyWith on DataUserXTM {
  /// Returns a callable class that can be used as follows: `instanceOfDataUserXTM.copyWith(...)` or like so:`instanceOfDataUserXTM.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DataUserXTMCWProxy get copyWith => _$DataUserXTMCWProxyImpl(this);

  /// Copies the object with the specific fields set to `null`. If you pass `false` as a parameter, nothing will be done and it will be ignored. Don't do it. Prefer `copyWith(field: null)` or `DataUserXTM(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DataUserXTM(...).copyWithNull(firstField: true, secondField: true)
  /// ````
  DataUserXTM copyWithNull({
    bool logout = false,
    bool user = false,
  }) {
    return DataUserXTM(
      logout: logout == true ? null : this.logout,
      user: user == true ? null : this.user,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataUserXTM _$DataUserXTMFromJson(Map json) => DataUserXTM(
      logout: json['logout'] as bool?,
      user: json['user'] == null
          ? null
          : User.fromJson(Map<String, dynamic>.from(json['user'] as Map)),
    );

Map<String, dynamic> _$DataUserXTMToJson(DataUserXTM instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logout', instance.logout);
  writeNotNull('user', instance.user);
  return val;
}
