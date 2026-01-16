import 'package:json_annotation/json_annotation.dart';

part 'notification_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class NotificationResponse<T> {
  final T? uninterestedNtfCtgrIds;
  final String? token;

  NotificationResponse(this.uninterestedNtfCtgrIds, {this.token});

  factory NotificationResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$NotificationResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$NotificationResponseToJson(this, toJsonT);
}