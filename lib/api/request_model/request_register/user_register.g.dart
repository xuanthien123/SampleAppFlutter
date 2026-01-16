// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserRegisterCWProxy {
  UserRegister fullName(String? fullName);

  UserRegister phoneNumber(String? phoneNumber);

  UserRegister roleId(String? roleId);

  UserRegister provinceId(int? provinceId);

  UserRegister districtId(int? districtId);

  UserRegister wardId(int? wardId);

  UserRegister password(String? password);

  UserRegister rePassword(String? rePassword);

  UserRegister certificates(List<String>? certificates);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserRegister(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserRegister(...).copyWith(id: 12, name: "My name")
  /// ````
  UserRegister call({
    String? fullName,
    String? phoneNumber,
    String? roleId,
    int? provinceId,
    int? districtId,
    int? wardId,
    String? password,
    String? rePassword,
    List<String>? certificates,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserRegister.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserRegister.copyWith.fieldName(...)`
class _$UserRegisterCWProxyImpl implements _$UserRegisterCWProxy {
  const _$UserRegisterCWProxyImpl(this._value);

  final UserRegister _value;

  @override
  UserRegister fullName(String? fullName) => this(fullName: fullName);

  @override
  UserRegister phoneNumber(String? phoneNumber) =>
      this(phoneNumber: phoneNumber);

  @override
  UserRegister roleId(String? roleId) => this(roleId: roleId);

  @override
  UserRegister provinceId(int? provinceId) => this(provinceId: provinceId);

  @override
  UserRegister districtId(int? districtId) => this(districtId: districtId);

  @override
  UserRegister wardId(int? wardId) => this(wardId: wardId);

  @override
  UserRegister password(String? password) => this(password: password);

  @override
  UserRegister rePassword(String? rePassword) => this(rePassword: rePassword);

  @override
  UserRegister certificates(List<String>? certificates) =>
      this(certificates: certificates);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserRegister(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserRegister(...).copyWith(id: 12, name: "My name")
  /// ````
  UserRegister call({
    Object? fullName = const $CopyWithPlaceholder(),
    Object? phoneNumber = const $CopyWithPlaceholder(),
    Object? roleId = const $CopyWithPlaceholder(),
    Object? provinceId = const $CopyWithPlaceholder(),
    Object? districtId = const $CopyWithPlaceholder(),
    Object? wardId = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? rePassword = const $CopyWithPlaceholder(),
    Object? certificates = const $CopyWithPlaceholder(),
  }) {
    return UserRegister(
      fullName: fullName == const $CopyWithPlaceholder()
          ? _value.fullName
          // ignore: cast_nullable_to_non_nullable
          : fullName as String?,
      phoneNumber: phoneNumber == const $CopyWithPlaceholder()
          ? _value.phoneNumber
          // ignore: cast_nullable_to_non_nullable
          : phoneNumber as String?,
      roleId: roleId == const $CopyWithPlaceholder()
          ? _value.roleId
          // ignore: cast_nullable_to_non_nullable
          : roleId as String?,
      provinceId: provinceId == const $CopyWithPlaceholder()
          ? _value.provinceId
          // ignore: cast_nullable_to_non_nullable
          : provinceId as int?,
      districtId: districtId == const $CopyWithPlaceholder()
          ? _value.districtId
          // ignore: cast_nullable_to_non_nullable
          : districtId as int?,
      wardId: wardId == const $CopyWithPlaceholder()
          ? _value.wardId
          // ignore: cast_nullable_to_non_nullable
          : wardId as int?,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String?,
      rePassword: rePassword == const $CopyWithPlaceholder()
          ? _value.rePassword
          // ignore: cast_nullable_to_non_nullable
          : rePassword as String?,
      certificates: certificates == const $CopyWithPlaceholder()
          ? _value.certificates
          // ignore: cast_nullable_to_non_nullable
          : certificates as List<String>?,
    );
  }
}

extension $UserRegisterCopyWith on UserRegister {
  /// Returns a callable class that can be used as follows: `instanceOfUserRegister.copyWith(...)` or like so:`instanceOfUserRegister.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserRegisterCWProxy get copyWith => _$UserRegisterCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRegister _$UserRegisterFromJson(Map json) => UserRegister(
      fullName: json['full_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      roleId: json['role_id'] as String?,
      provinceId: json['province_id'] as int?,
      districtId: json['district_id'] as int?,
      wardId: json['ward_id'] as int?,
      password: json['password'] as String?,
      rePassword: json['re_password'] as String?,
      certificates: (json['certificates'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    )
      ..xtm = json['xtm'] as bool?
      ..xtmUserId = json['xtm_user_id'] as String?;

Map<String, dynamic> _$UserRegisterToJson(UserRegister instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('full_name', instance.fullName);
  writeNotNull('phone_number', instance.phoneNumber);
  writeNotNull('role_id', instance.roleId);
  writeNotNull('province_id', instance.provinceId);
  writeNotNull('district_id', instance.districtId);
  writeNotNull('ward_id', instance.wardId);
  writeNotNull('xtm', instance.xtm);
  writeNotNull('xtm_user_id', instance.xtmUserId);
  writeNotNull('password', instance.password);
  writeNotNull('re_password', instance.rePassword);
  writeNotNull('certificates', instance.certificates);
  return val;
}
