// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LoginRequestCWProxy {
  LoginRequest remember(bool? remember);

  LoginRequest password(String? password);

  LoginRequest username(String? username);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginRequest call({
    bool? remember,
    String? password,
    String? username,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLoginRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLoginRequest.copyWith.fieldName(...)`
class _$LoginRequestCWProxyImpl implements _$LoginRequestCWProxy {
  const _$LoginRequestCWProxyImpl(this._value);

  final LoginRequest _value;

  @override
  LoginRequest remember(bool? remember) => this(remember: remember);

  @override
  LoginRequest password(String? password) => this(password: password);

  @override
  LoginRequest username(String? username) => this(username: username);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginRequest call({
    Object? remember = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? username = const $CopyWithPlaceholder(),
  }) {
    return LoginRequest(
      remember: remember == const $CopyWithPlaceholder()
          ? _value.remember
          // ignore: cast_nullable_to_non_nullable
          : remember as bool?,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String?,
      username: username == const $CopyWithPlaceholder()
          ? _value.username
          // ignore: cast_nullable_to_non_nullable
          : username as String?,
    );
  }
}

extension $LoginRequestCopyWith on LoginRequest {
  /// Returns a callable class that can be used as follows: `instanceOfLoginRequest.copyWith(...)` or like so:`instanceOfLoginRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LoginRequestCWProxy get copyWith => _$LoginRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map json) => LoginRequest(
      remember: json['remember'] as bool? ?? true,
      password: json['password'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('remember', instance.remember);
  writeNotNull('password', instance.password);
  writeNotNull('username', instance.username);
  return val;
}
