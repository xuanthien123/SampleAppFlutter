import 'package:flutter_base_architecture/api/response_model/pagination.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paging_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PagingResponse<T> {
  final T? entries;
  final Pagination? pagination;
  int? totalNumberOfUnreadNtfs;

  PagingResponse({this.entries, this.pagination, this.totalNumberOfUnreadNtfs});


  factory PagingResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$PagingResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$PagingResponseToJson(this, toJsonT);

}
