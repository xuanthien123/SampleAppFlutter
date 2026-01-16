// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationResponse<T> _$NotificationResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    NotificationResponse<T>(
      _$nullableGenericFromJson(json['uninterestedNtfCtgrIds'], fromJsonT),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$NotificationResponseToJson<T>(
  NotificationResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'uninterestedNtfCtgrIds':
          _$nullableGenericToJson(instance.uninterestedNtfCtgrIds, toJsonT),
      'token': instance.token,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
