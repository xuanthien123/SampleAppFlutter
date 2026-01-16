// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PaginationCWProxy {
  Pagination page(dynamic page);

  Pagination count(int? count);

  Pagination length(dynamic length);

  Pagination search(dynamic search);

  Pagination orderBy(dynamic orderBy);

  Pagination orderDir(dynamic orderDir);

  Pagination total(int? total);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Pagination(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Pagination(...).copyWith(id: 12, name: "My name")
  /// ````
  Pagination call({
    dynamic page,
    int? count,
    dynamic length,
    dynamic search,
    dynamic orderBy,
    dynamic orderDir,
    int? total,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPagination.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPagination.copyWith.fieldName(...)`
class _$PaginationCWProxyImpl implements _$PaginationCWProxy {
  const _$PaginationCWProxyImpl(this._value);

  final Pagination _value;

  @override
  Pagination page(dynamic page) => this(page: page);

  @override
  Pagination count(int? count) => this(count: count);

  @override
  Pagination length(dynamic length) => this(length: length);

  @override
  Pagination search(dynamic search) => this(search: search);

  @override
  Pagination orderBy(dynamic orderBy) => this(orderBy: orderBy);

  @override
  Pagination orderDir(dynamic orderDir) => this(orderDir: orderDir);

  @override
  Pagination total(int? total) => this(total: total);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Pagination(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Pagination(...).copyWith(id: 12, name: "My name")
  /// ````
  Pagination call({
    Object? page = const $CopyWithPlaceholder(),
    Object? count = const $CopyWithPlaceholder(),
    Object? length = const $CopyWithPlaceholder(),
    Object? search = const $CopyWithPlaceholder(),
    Object? orderBy = const $CopyWithPlaceholder(),
    Object? orderDir = const $CopyWithPlaceholder(),
    Object? total = const $CopyWithPlaceholder(),
  }) {
    return Pagination(
      page: page == const $CopyWithPlaceholder() || page == null
          ? _value.page
          // ignore: cast_nullable_to_non_nullable
          : page as dynamic,
      count: count == const $CopyWithPlaceholder()
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int?,
      length: length == const $CopyWithPlaceholder() || length == null
          ? _value.length
          // ignore: cast_nullable_to_non_nullable
          : length as dynamic,
      search: search == const $CopyWithPlaceholder() || search == null
          ? _value.search
          // ignore: cast_nullable_to_non_nullable
          : search as dynamic,
      orderBy: orderBy == const $CopyWithPlaceholder() || orderBy == null
          ? _value.orderBy
          // ignore: cast_nullable_to_non_nullable
          : orderBy as dynamic,
      orderDir: orderDir == const $CopyWithPlaceholder() || orderDir == null
          ? _value.orderDir
          // ignore: cast_nullable_to_non_nullable
          : orderDir as dynamic,
      total: total == const $CopyWithPlaceholder()
          ? _value.total
          // ignore: cast_nullable_to_non_nullable
          : total as int?,
    );
  }
}

extension $PaginationCopyWith on Pagination {
  /// Returns a callable class that can be used as follows: `instanceOfPagination.copyWith(...)` or like so:`instanceOfPagination.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PaginationCWProxy get copyWith => _$PaginationCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagination _$PaginationFromJson(Map json) => Pagination(
      page: json['page'],
      count: json['count'] as int?,
      length: json['length'],
      search: json['search'],
      orderBy: json['order_by'],
      orderDir: json['order_dir'],
      total: json['total'] as int?,
    )..reachMaxPage = json['reachMaxPage'] as bool?;

Map<String, dynamic> _$PaginationToJson(Pagination instance) {
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
  writeNotNull('count', instance.count);
  writeNotNull('total', instance.total);
  return val;
}
