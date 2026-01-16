import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/theme/colors.dart';
import 'package:flutter_base_architecture/utils/helper.dart';

void showAlertDialog(
  BuildContext context, {
  String message = '',
  Widget? widget,
  String title = 'Thông báo',
  required String buttonName1,
  String? buttonName2,
  required callback1,
  callback2,
  barrierDismissible = true,
}) {
  showDialog(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (context) => WillPopScope(
        child: CupertinoAlertDialog(
          title: (!isEmpty(title)) ? Text(title) : null,
          content: (isEmpty(widget)) ? Text(message) : widget,
          actions: (isEmpty(buttonName2))
              ? [
                  CupertinoDialogAction(
                    child: Text(
                      buttonName1,
                      style: TextStyle(color: AppColors.primaryBlue),
                    ),
                    onPressed: callback1,
                  ),
                ]
              : [
                  CupertinoDialogAction(
                    child: Text(
                      buttonName1,
                    ),
                    onPressed: callback1,
                  ),
                  CupertinoDialogAction(
                    child: Text(
                      buttonName2!,
                      style: TextStyle(color: AppColors.primaryBlue),
                    ),
                    onPressed: callback2,
                  ),
                ],
        ),
        onWillPop: () async => barrierDismissible),
  );
}

Future<bool?> showConfirmationDialog(
  BuildContext context, {
  String message = '',
  Widget? widget,
  String title = 'Thông báo',
  required String buttonName1,
  required String buttonName2,
  required callback1,
  callback2,
  barrierDismissible = true,
}) {
  return showDialog<bool>(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (context) => WillPopScope(
        child: CupertinoAlertDialog(
          title: Text(title),
          content: (isEmpty(widget)) ? Text(message) : widget,
          actions: (isEmpty(buttonName2))
              ? [
                  CupertinoDialogAction(
                    child: Text(
                      buttonName1,
                      style: TextStyle(color: AppColors.primaryBlue),
                    ),
                    onPressed: callback1,
                  ),
                ]
              : [
                  CupertinoDialogAction(
                    child: Text(
                      buttonName1,
                    ),
                    onPressed: callback1,
                  ),
                  CupertinoDialogAction(
                    child: Text(
                      buttonName2,
                      style: TextStyle(color: AppColors.primaryBlue),
                    ),
                    onPressed: callback2,
                  ),
                ],
        ),
        onWillPop: () async => barrierDismissible),
  );
}
