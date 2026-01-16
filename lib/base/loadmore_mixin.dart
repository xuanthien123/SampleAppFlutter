import 'dart:async';

import 'package:flutter_base_architecture/api/api_response.dart';
import 'package:flutter_base_architecture/api/request_model/paging_request.dart';
import 'package:flutter_base_architecture/api/response_model/paging_response.dart';

abstract class LoadMoreMixin<T> {
  List<T> _items = [];

  bool showEmptyLayout = false;
  int numberResult = 0;
  bool isError = false;
  bool _isShowEmptyLayout = false;

  PagingRequest pagingRequest = PagingRequest.init();

  refreshData() async {
    pagingRequest = PagingRequest.init()..search = pagingRequest.search;
    await loadData(refresh: true);
  }

  loadMore() async {
    if (!pagingRequest.reachMaxPage!) {
      pagingRequest.page = pagingRequest.page! + 1;
      await loadData();
    }
  }

  search(String query) async {
    if (query == pagingRequest.search) return;
    pagingRequest = PagingRequest.search(search: query);
    await refreshData();
  }

  loadData({bool refresh = false}) async {
    // isError = false;
    try {
      notifyLoading = true;
      final response = await getData();
      if (refresh) {
        _items = [];
      }
      if (response.isOk) {
        final data = response.data?.entries as List<T>;
        numberResult = response.data?.pagination?.total ?? 0;
        if (data.isEmpty) {
          pagingRequest.reachMaxPage = true;
          if (pagingRequest.page == 1) {
            showEmptyLayout = true;
          }
        } else {
          showEmptyLayout = false;
          if (pagingRequest.page == 1) {
            _items
              ..clear()
              ..addAll(data);
          } else {
            _items.addAll(data);
          }
          notifyData();
        }
      }
      isError = false;
      notifyLoading = false;
    } catch (e) {
      print(e);
      isError = true;
      notifyLoading = false;
    }
  }

  Future<ApiResponse<PagingResponse<List<T>>>> getData();

  void notifyData();

  set notifyLoading(bool value);

  bool isListLoading();

  List<T> get data => _items;

  bool get isShowEmptyLayout {
    if (data.isEmpty && !isListLoading()) {
      _isShowEmptyLayout = true;
    }
    if (data.isNotEmpty) {
      _isShowEmptyLayout = false;
    }
    return _isShowEmptyLayout;
  }

  bool get isShowLoading {
    return !isShowEmptyLayout && data.isEmpty && isListLoading();
  }
}
