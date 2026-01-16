import 'package:flutter/foundation.dart';
import 'package:flutter_base_architecture/models/user_xtm/user_xtm.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';

import '../models/data/data_user_xtm.dart';
import '../models/user/exist_account_xtm/exist_account_xtm.dart';
import '../models/user/user.dart';

late GlobalApi globalApi = GlobalApi();

class GlobalApi with ChangeNotifier {
  GlobalApi();
  bool initApp = true;
  bool initCheckStatus = true;
  String token = '';
  User? user;
  UserXTM? userXTM;
  Position? curPosition;
  DataUserXTM? dataUserXTM;  
  ExistAccountXTM? existAccountXTM;

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
