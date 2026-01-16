import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_google_location_picker/export.dart';
import 'package:http/http.dart';

import 'http_request_customer.dart';

class RequestServiceCustomer {
  RequestServiceCustomer._privateConstructor();

  static final RequestServiceCustomer _instance = RequestServiceCustomer._privateConstructor();

  factory RequestServiceCustomer() {
    return _instance;
  }

  initState(Function() onNotifyFunction) {
    _onNotify = onNotifyFunction;
  }

  Function()? _onNotify;

  void notifyListener() {
    _onNotify?.call();
  }

  Future<String> requestLocationName(
      {required double latitude, required double longitude}) async {
    Map<String, dynamic> decodedResponse =
        await HttpRequestCustomer.requestWithLatLng(
            latitude: latitude, longitude: longitude);
    notifyListener();
    return await RequestServiceCustomer.checkInternet() == true
       ? decodedResponse['display_name'] ?? "Không tìm thấy dữ liệu"
       : 'Vui lòng kết nối internet';
    
  }

  Future<List<OSMData>> requestSearch(
      {required Client client, required String search}) async {
    var response = await HttpRequestCustomer.requestWithSearch(
        client: client, search: search);
    notifyListener();
    if (response.isNotEmpty) {
      return response.map((e) => OSMData.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<PickedData> pickData(
      {required double latitude, required double longitude}) async {
    LatLong latLong = LatLong(latitude: latitude, longitude: longitude);

    Map<String, dynamic> decodedResponse =
        await HttpRequestCustomer.requestWithLatLng(
            latitude: latLong.latitude, longitude: latLong.longitude);
    notifyListener();
    PickedData pickedData = PickedData.fromJson(decodedResponse, latLong);
    String postCode = "";
    String country = "";
    List<String> values = [];
    try {
      values = pickedData.displayName.split(",");
      if (pickedData.address!.postCode.isNotNullOrEmpty()) {
        postCode = pickedData.address!.postCode;
      } else {
        for (var element in values) {
          if (element.trim().isZip5Code()) {
            postCode = element.trim();
          }
        }
        pickedData.address!.postCode = postCode;
      }
    } catch (e) {
      country = "";
    }
    try {
      if (pickedData.address!.country.isNotNullOrEmpty()) {
        country = pickedData.address!.country;
      } else {
        if (values.isNotEmpty) {
          country = values.last.trim();
        }
        pickedData.address!.country = country;
      }
    } catch (e) {
      country = "";
    }
    return pickedData;
  }

  static Future<bool> checkInternet() async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return false;
    }
  }
}
