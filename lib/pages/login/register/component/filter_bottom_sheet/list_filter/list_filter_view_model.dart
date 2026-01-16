import 'package:flutter_base_architecture/base/base_view_model.dart';
import 'package:flutter_base_architecture/models/address/district.dart';
import 'package:flutter_base_architecture/models/address/ward.dart';
import 'package:flutter_base_architecture/models/address/province.dart';
import 'package:flutter_base_architecture/preference/preference.dart';
import 'package:flutter_base_architecture/repository/filter_repository.dart';
import 'package:flutter_base_architecture/utils/extensions.dart';

class ListFilterViewModel<T> extends BaseViewModel{
  final FilterRepository repository;
  final images = ['http://bizweb.dktcdn.net/thumb/grande/100/112/903/products/4-da27681e-1bc4-44af-8444-d2ceb9d2c7b2.jpg?v=1587389543077','https://giadinh.mediacdn.vn/2015/thanhlong-1435825834109.jpg','https://lh3.googleusercontent.com/proxy/D1N8JzMdlF-Ptw07qCttkXY50P3OQt4CmBBUH8sr26UxsGzrcqwd5WJtHFJ-AcUjLc5jmNf0pOqgyyJY6PtaBbTl2Y-RTLQtAjbCer0udW4qTpJu-jrLkn_CvHIW9j6WB8RSXOfuVXqMWJpyica6APJBS9jHLdw'];
  List<dynamic> items = [];
  List<dynamic> temp = [];
  T? selectedItem;
  final int? provinceId;
  final int? districtId;
  final int? wardId;
  String token = PreferenceManager.getString(PreferenceManager.KEY_ACCESS_TOKEN, '');

  ListFilterViewModel(this.repository,{T? selectedItem, this.provinceId, this.districtId, this.wardId}) : super(repository) {
    switch (T) {
      case Province:
        this.selectedItem = (selectedItem as Province?)?.copyWith() as T?;
        break;
      case District:
        this.selectedItem = (selectedItem as District?)?.copyWith() as T?;
        break;
      case Ward:
        this.selectedItem = (selectedItem as Ward?)?.copyWith() as T?;
        break;
    }
    getDataMaster();
  }

  getDataMaster() async {
    setLoading = true;
    var response;
    switch (T) {
      case Province:
        response = await repository.getListProvince();
        break;
      case District:
        response = await repository.getListDistrict(provinceId!);
        break;
      case Ward:
        response = await repository.getListWard(districtId!);
        break;
    }

    if (response.isOk) {
      items = response.data?.entries ?? [] as List<T>;
      temp
        ..clear()
        ..addAll(items);
    }
    setLoading = false;
  }

  refreshFilter() {
    selectedItem = null;
    notifyListeners();
  }

  set updateSelection(T? selected) {
    selectedItem = selected;
    notifyListeners();
  }

  onSearchChange(String value) {
    if (value.isEmpty) {
      items
        ..clear()
        ..addAll(temp.map((e) => e as T).toList());
    } else {
      items
        ..clear()
        ..addAll(temp.map((e) => e as T).toList());
      items = items.where((element) => (element.name as String).search(value)).toList();
    }
    notifyListeners();
  }
}
