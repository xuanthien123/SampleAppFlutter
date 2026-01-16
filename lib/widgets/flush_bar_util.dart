import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/theme/colors.dart';
import 'package:flutter_base_architecture/theme/styles.dart';

enum FlushBarType { SUCCESS, ERROR, INFO }

class FlushBarUtil {
  static _show(String message,
      {FlushBarType flushBarType = FlushBarType.SUCCESS, int duration = 3}) {
    IconData icon = CupertinoIcons.info;
    Color color;

    switch (flushBarType) {
      case FlushBarType.SUCCESS:
        color = AppColors.primaryGreen;
        break;
      case FlushBarType.ERROR:
        color = AppColors.errorColor;
        break;
      case FlushBarType.INFO:
        color = AppColors.warningColor;
        break;
      default:
        color = AppColors.primaryGreen;
        break;
    }
    BotToast.showCustomNotification(
        align: Alignment(0, 0.80),
        animationDuration: Duration(milliseconds: 200),
        animationReverseDuration: Duration(milliseconds: 200),
        duration: Duration(seconds: duration),
        backButtonBehavior: BackButtonBehavior.none,
        toastBuilder: (_) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryGreen.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: Offset(0, 4), // changes position of shadow
                  ),
                ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    message,
                    style: TextStyle(
                        color: color,
                        fontFamily: AppStyles.Roboto,
                        fontSize: 14),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Icon(
                    icon,
                    color: color,
                  ),
                ),
              ],
            ),
          );
        },
        enableSlideOff: true,
        onlyOne: true,
        crossPage: true);
  }

  static showSuccess(String message) =>
      _show(message, flushBarType: FlushBarType.SUCCESS);

  static showError(String message) =>
      _show(message, flushBarType: FlushBarType.ERROR);

  static showInfo(String message) =>
      _show(message, flushBarType: FlushBarType.INFO);

  static showMessage({required String message, int duration = 3}) {
    BotToast.showCustomNotification(
        align: Alignment(0, 0.60),
        animationDuration: Duration(milliseconds: 200),
        animationReverseDuration: Duration(milliseconds: 200),
        duration: Duration(seconds: duration),
        backButtonBehavior: BackButtonBehavior.none,
        toastBuilder: (_) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 60),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromRGBO(34, 49, 63, 0.80),
              ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  message,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: AppStyles.Roboto,
                      fontSize: 14),
                ),
              ],
            ),
          );
        },
        enableSlideOff: true,
        onlyOne: true,
        crossPage: true);
  }
}
