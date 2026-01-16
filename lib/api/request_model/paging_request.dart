import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paging_request.g.dart';

@CopyWith(copyWithNull: false)
@JsonSerializable(anyMap: true, includeIfNull: false)
class PagingRequest {
  int? page;
  int? length = 20;
  String? search;
  @JsonKey(name: 'order_by')
  String? orderBy;
  @JsonKey(name: 'order_dir')
  String? orderDir;
  bool? reachMaxPage;

  PagingRequest(
      {this.page,
      this.length = 20,
      this.search,
      this.orderBy,
      this.orderDir,
      this.reachMaxPage = false});

  PagingRequest.init(
      {this.length = 20, this.search, this.orderBy, this.orderDir})
      : this.reachMaxPage = false,
        this.page = 1;

  PagingRequest.all({this.length, this.search, this.orderBy, this.orderDir})
      : this.reachMaxPage = false,
        this.page = 1;

  PagingRequest.search(
      {this.length = 20, this.search, this.orderBy, this.orderDir})
      : this.reachMaxPage = false,
        this.page = 1;

  factory PagingRequest.fromJson(Map<String, dynamic> json) =>
      _$PagingRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PagingRequestToJson(this);
}
