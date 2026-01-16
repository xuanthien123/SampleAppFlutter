import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../res.dart';

class DialogUtils {
  static DialogUtils _instance = DialogUtils.internal();

  DialogUtils.internal();

  factory DialogUtils() => _instance;

  static void showCustomDialog(BuildContext context,
      {required String title,
      required String message,
      required Widget customChild,
      String okBtnText = "Hủy",
      String cancelBtnText = "Đồng ý",
      Function? onOkPressed,
      Function? onCancelPressed,
      EdgeInsetsGeometry? padding,
      bool? isPinkColor = false}) {
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.7),
      transitionDuration: Duration(milliseconds: 200),
      context: context,
      pageBuilder: (dialogContext, anim1, anim2) {
        return Align(
          alignment: Alignment.center,
          child: IntrinsicHeight(
            child: Container(
              width: MediaQuery.of(dialogContext).size.width * 0.9,
              padding: padding ?? EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                children: [
                  customChild,
                  // Positioned(
                  //   right: -10,
                  //   top: -10,
                  //   child: IconButton(
                  //     onPressed: () {
                  //       Navigator.pop(dialogContext);
                  //     },
                  //     icon: SvgPicture.asset(Res.ic_simple_clear),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
