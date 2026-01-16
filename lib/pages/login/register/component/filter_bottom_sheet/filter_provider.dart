import 'package:flutter/cupertino.dart';
import 'package:flutter_base_architecture/models/address/district.dart';
import 'package:flutter_base_architecture/models/address/ward.dart';
import 'package:flutter_base_architecture/models/address/province.dart';
import 'package:rxdart/rxdart.dart';

class FilterProvider extends ChangeNotifier {
  Province? province;
  District? district;
  Ward? ward;

  removeDistrict() {
    this.district = null;
    notifyListeners();
  }

  removeProvince() {
    this.province = null;
    this.district = null;
    notifyListeners();
  }

  resetProductFilter({bool needNotify = true}) {
    this.province = null;
    this.district = null;
    if (needNotify) notifyListeners();
  }

  updateProductFilter(dynamic value, dynamic type) {
    if (type == Province) {
      if (this.province != value) {
        this.province = value;
        this.district = null;
      }
    }
    if (type == District) {
      this.district = value;
    }
    notifyListeners();
  }

  Province? manufactureProvince;
  District? manufactureDistrict;
  Ward? manufactureWard;

  resetManufactureFilter() {
    this.manufactureProvince = null;
    this.manufactureDistrict = null;
    this.manufactureWard = null;
    notifyListeners();
  }

  updateManufactureFilter(dynamic value, dynamic type) {
    if (type == Province) {
      if (this.manufactureProvince != value) {
        this.manufactureProvince = value;
        this.manufactureDistrict = null;
        this.manufactureWard = null;
      }
    }
    if (type == District) {
      this.manufactureDistrict = value;
      this.manufactureWard = null;
    }
    if (type == Ward) {
      this.manufactureWard = value;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
