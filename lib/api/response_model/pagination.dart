import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_base_architecture/api/request_model/paging_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pagination.g.dart';

@CopyWith(copyWithNull: false)
@JsonSerializable(anyMap: true, includeIfNull: false)
class Pagination extends PagingRequest {
  int? count;
  int? total;

  Pagination({page, this.count, length, search, orderBy, orderDir, this.total}) : super(page: page, length: length, search: search, orderBy: orderBy, orderDir: orderBy);

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
