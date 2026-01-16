// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'normal_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NormalResponse<T> _$NormalResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    NormalResponse<T>(
      fromJsonT(json['entry']),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$NormalResponseToJson<T>(
  NormalResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'entry': toJsonT(instance.entry),
      'token': instance.token,
    };
