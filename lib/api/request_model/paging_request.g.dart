// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paging_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PagingRequestCWProxy {
  PagingRequest page(int? page);

  PagingRequest length(int? length);

  PagingRequest search(String? search);

  PagingRequest orderBy(String? orderBy);

  PagingRequest orderDir(String? orderDir);

  PagingRequest reachMaxPage(bool? reachMaxPage);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PagingRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PagingRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  PagingRequest call({
    int? page,
    int? length,
    String? search,
    String? orderBy,
    String? orderDir,
    bool? reachMaxPage,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPagingRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPagingRequest.copyWith.fieldName(...)`
class _$PagingRequestCWProxyImpl implements _$PagingRequestCWProxy {
  const _$PagingRequestCWProxyImpl(this._value);

  final PagingRequest _value;

  @override
  PagingRequest page(int? page) => this(page: page);

  @override
  PagingRequest length(int? length) => this(length: length);

  @override
  PagingRequest search(String? search) => this(search: search);

  @override
  PagingRequest orderBy(String? orderBy) => this(orderBy: orderBy);

  @override
  PagingRequest orderDir(String? orderDir) => this(orderDir: orderDir);

  @override
  PagingRequest reachMaxPage(bool? reachMaxPage) =>
      this(reachMaxPage: reachMaxPage);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PagingRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PagingRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  PagingRequest call({
    Object? page = const $CopyWithPlaceholder(),
    Object? length = const $CopyWithPlaceholder(),
    Object? search = const $CopyWithPlaceholder(),
    Object? orderBy = const $CopyWithPlaceholder(),
    Object? orderDir = const $CopyWithPlaceholder(),
    Object? reachMaxPage = const $CopyWithPlaceholder(),
  }) {
    return PagingRequest(
      page: page == const $CopyWithPlaceholder()
          ? _value.page
          // ignore: cast_nullable_to_non_nullable
          : page as int?,
      length: length == const $CopyWithPlaceholder()
          ? _value.length
          // ignore: cast_nullable_to_non_nullable
          : length as int?,
      search: search == const $CopyWithPlaceholder()
          ? _value.search
          // ignore: cast_nullable_to_non_nullable
          : search as String?,
      orderBy: orderBy == const $CopyWithPlaceholder()
          ? _value.orderBy
          // ignore: cast_nullable_to_non_nullable
          : orderBy as String?,
      orderDir: orderDir == const $CopyWithPlaceholder()
          ? _value.orderDir
          // ignore: cast_nullable_to_non_nullable
          : orderDir as String?,
      reachMaxPage: reachMaxPage == const $CopyWithPlaceholder()
          ? _value.reachMaxPage
          // ignore: cast_nullable_to_non_nullable
          : reachMaxPage as bool?,
    );
  }
}

extension $PagingRequestCopyWith on PagingRequest {
  /// Returns a callable class that can be used as follows: `instanceOfPagingRequest.copyWith(...)` or like so:`instanceOfPagingRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PagingRequestCWProxy get copyWith => _$PagingRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagingRequest _$PagingRequestFromJson(Map json) => PagingRequest(
      page: json['page'] as int?,
      length: json['length'] as int? ?? 20,
      search: json['search'] as String?,
      orderBy: json['order_by'] as String?,
      orderDir: json['order_dir'] as String?,
      reachMaxPage: json['reachMaxPage'] as bool? ?? false,
    );

Map<String, dynamic> _$PagingRequestToJson(PagingRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('page', instance.page);
  writeNotNull('length', instance.length);
  writeNotNull('search', instance.search);
  writeNotNull('order_by', instance.orderBy);
  writeNotNull('order_dir', instance.orderDir);
  writeNotNull('reachMaxPage', instance.reachMaxPage);
  return val;
}
