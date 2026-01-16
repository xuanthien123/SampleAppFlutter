// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_token.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AccessTokenCWProxy {
  AccessToken accessToken(String? accessToken);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccessToken(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccessToken(...).copyWith(id: 12, name: "My name")
  /// ````
  AccessToken call({
    String? accessToken,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAccessToken.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAccessToken.copyWith.fieldName(...)`
class _$AccessTokenCWProxyImpl implements _$AccessTokenCWProxy {
  const _$AccessTokenCWProxyImpl(this._value);

  final AccessToken _value;

  @override
  AccessToken accessToken(String? accessToken) =>
      this(accessToken: accessToken);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccessToken(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccessToken(...).copyWith(id: 12, name: "My name")
  /// ````
  AccessToken call({
    Object? accessToken = const $CopyWithPlaceholder(),
  }) {
    return AccessToken(
      accessToken: accessToken == const $CopyWithPlaceholder()
          ? _value.accessToken
          // ignore: cast_nullable_to_non_nullable
          : accessToken as String?,
    );
  }
}

extension $AccessTokenCopyWith on AccessToken {
  /// Returns a callable class that can be used as follows: `instanceOfAccessToken.copyWith(...)` or like so:`instanceOfAccessToken.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AccessTokenCWProxy get copyWith => _$AccessTokenCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessToken _$AccessTokenFromJson(Map json) => AccessToken(
      accessToken: json['accessToken'] as String?,
    );

Map<String, dynamic> _$AccessTokenToJson(AccessToken instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('accessToken', instance.accessToken);
  return val;
}
