import 'package:json_annotation/json_annotation.dart';

part 'normal_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class NormalResponse<T> {
  final T entry;
  final String? token;

  NormalResponse(this.entry, {this.token});

  factory NormalResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$NormalResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$NormalResponseToJson(this, toJsonT);
}
