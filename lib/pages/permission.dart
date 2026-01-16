import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/main.dart';
import 'package:flutter_base_architecture/res.dart';
import 'package:flutter_base_architecture/widgets/show_dialog_successful.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../widgets/alert_dialog.dart';


class PermissionHandler {
  static Future<bool> checkPermission(Permission permission, String permissionText) async{
    PermissionStatus status = await permission.status;
    if (status.isGranted) {
      return true;
    } else {
      status = await permission.request();
      if (status.isGranted) {
        return true;
      } else {
        showAlertDialog(Get.context!, message: 'Bạn cần cấp quyền truy cập $permissionText để thực hiện chức năng này', buttonName1: 'Vào cài đặt',
            callback1: () {
              openAppSettings();
              Navigator.pop(Get.context!);
            });
        return false;
      }
    }
  }

  static Future<bool> checkMultiplePermissions(List<Permission> permissions, permissionText) async{
    bool isPermitted = true;
    for (int i = 0; i < permissions.length; i++) {
      PermissionStatus status = await permissions[i].status;
      if (!status.isGranted) {
        isPermitted = false;
        break;
      }
    }
    if (isPermitted) {
      return isPermitted;
    } else {
      Map<Permission, PermissionStatus> statuses = await permissions.request();
      isPermitted = true;
      for(PermissionStatus status in statuses.values) {
        if (!status.isGranted) {
          isPermitted = false;
          break;
        }
      }
      if (isPermitted) {
        return isPermitted;
      } else {
        showAlertDialog(Get.context!, message: 'Bạn cần cấp quyền truy cập $permissionText để thực hiện chức năng này', buttonName1: 'Vào cài đặt',
            callback1: () {
              openAppSettings();
              Navigator.pop(Get.context!);
            });
        return isPermitted;
      }
    }
  }
  static Future<bool> checkPermissionCamera() async {
    final status = await Permission.camera.request();
    if(status == PermissionStatus.granted){
      return true;
    }
    else if (status == PermissionStatus.denied) {
      var result = await Permission.camera.request();
      if (result == PermissionStatus.granted) {
      } else if (result == PermissionStatus.denied) {
        showAlertDialogPermission(
          navigatorGlobal.currentContext!,
          title: "Cho phép ứng dụng truy cập vào camera",
          btnConfirm: "Xác nhận",
          iconDialog: Res.icon,
          onPressed: () async {
            Navigator.pop(navigatorGlobal.currentContext!);
            Geolocator.openAppSettings();
          },
        );
      } else if (result == PermissionStatus.permanentlyDenied) {
        showAlertDialogPermission(
          navigatorGlobal.currentContext!,
          title: "Cho phép ứng dụng truy cập vào camera",
          btnConfirm: "Xác nhận",
          iconDialog: Res.icon,
          onPressed: () async {
            Navigator.pop(navigatorGlobal.currentContext!);
            Geolocator.openAppSettings();
          },
        );
      }
    } else if (status == PermissionStatus.permanentlyDenied) {
      showAlertDialogPermission(
        navigatorGlobal.currentContext!,
        title: "Cho phép ứng dụng truy cập vào camera",
        btnConfirm: "Xác nhận",
        iconDialog: Res.icon,
        onPressed: () async {
          Navigator.pop(navigatorGlobal.currentContext!);
          Geolocator.openAppSettings();
        },
      );
    }
    return true;
  }
  static Future<bool> checkPermissionCameraAndMicro() async {
    final status = await [Permission.camera, Permission.microphone].request();
    if((await Permission.camera.status == PermissionStatus.granted)
             && (await Permission.microphone.status == PermissionStatus.granted)){
      return true;
    }
    else if (!((await Permission.camera.status == PermissionStatus.granted)
              && (await Permission.microphone.status == PermissionStatus.granted))) {
      var result = await [Permission.camera, Permission.microphone].request();
       if (!((await Permission.camera.status == PermissionStatus.granted)
             && (await Permission.microphone.status == PermissionStatus.granted))) {
        showAlertDialogPermission(
          navigatorGlobal.currentContext!,
          title: "Cho phép ứng dụng truy cập vào camera và micro",
          btnConfirm: "Xác nhận",
          iconDialog: Res.icon,
          onPressed: () async {
            Navigator.pop(navigatorGlobal.currentContext!);
            Geolocator.openAppSettings();
          },
        );
      } 
    }
    return true;
  }

  static Future<bool> checkPermissionStorage() async {
    bool upperSdk33 = false;
    if (Platform.isAndroid) {
      final deviceInfo = await DeviceInfoPlugin().androidInfo;
      if (deviceInfo.version.sdkInt > 32) {
        upperSdk33 = true;
      }
    }
    PermissionStatus status;
    if (upperSdk33) {
      status = await Permission.manageExternalStorage.request();
    } else {
      status = await Permission.storage.request();
    }
    if(status == PermissionStatus.granted){
      return true;
    }
    else if (status == PermissionStatus.denied) {
      PermissionStatus result;
      if (upperSdk33) {
        result = await Permission.manageExternalStorage.status;
      } else {
        result = await Permission.storage.status;
      }
      if (result == PermissionStatus.granted) {
      } else if (result == PermissionStatus.denied) {
        showAlertDialogPermission(
          navigatorGlobal.currentContext!,
          title: "Cho phép ứng dụng truy cập vào bộ nhớ trong",
          btnConfirm: "Xác nhận",
          iconDialog: Res.icon,
          onPressed: () async {
            Navigator.pop(navigatorGlobal.currentContext!);
            Geolocator.openAppSettings();
          },
        );
      } else if (result == PermissionStatus.permanentlyDenied) {
        showAlertDialogPermission(
          navigatorGlobal.currentContext!,
          title: "Cho phép ứng dụng truy cập vào bộ nhớ trong",
          btnConfirm: "Xác nhận",
          iconDialog: Res.icon,
          onPressed: () async {
            Navigator.pop(navigatorGlobal.currentContext!);
            Geolocator.openAppSettings();
          },
        );
      }
    } else if (status == PermissionStatus.permanentlyDenied) {
      showAlertDialogPermission(
        navigatorGlobal.currentContext!,
        title: "Cho phép ứng dụng truy cập vào bộ nhớ trong",
        btnConfirm: "Xác nhận",
        iconDialog: Res.icon,
        onPressed: () async {
          Navigator.pop(navigatorGlobal.currentContext!);
          Geolocator.openAppSettings();
        },
      );
    }
    return true;
  }

  static Future<bool> isStoragePermissionAllow() async {
    bool upperSdk33 = false;
    if (Platform.isAndroid) {
      final deviceInfo = await DeviceInfoPlugin().androidInfo;
      if (deviceInfo.version.sdkInt > 32) {
        return Permission.manageExternalStorage.isGranted;
      }
    }
    return Permission.storage.isGranted; 
  }
}
