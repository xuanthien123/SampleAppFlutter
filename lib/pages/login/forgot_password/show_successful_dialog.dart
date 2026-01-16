import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/page_routes.dart';
import 'package:flutter_base_architecture/res.dart';
import 'package:flutter_base_architecture/theme/app_strings.dart';
import 'package:flutter_base_architecture/theme/colors.dart';
import 'package:flutter_base_architecture/theme/styles.dart';
import 'package:flutter_base_architecture/utils/extensions/context_extension.dart';
import 'package:flutter_base_architecture/widgets/button_with_border.dart';
import 'package:flutter_svg/flutter_svg.dart';

showSuccessfulDialog({required BuildContext context}) {
  return showDialog(
    context: context,
    useRootNavigator: true,
    barrierDismissible: false,
    builder: (_) {
      return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Dialog(
          shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
          insetPadding: EdgeInsets.all(19),
          child: Container(
            width: context.width - 38,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  Res.image_check_successful,
                  width: 74,
                ),
                SizedBox(height: 20),
                Text(
                  "Đổi mật khẩu thành công!",
                  style: TextStyle(
                    color: AppColors.primaryBlue[500],
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: 274,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'Giờ đây, bạn đã có thể đăng nhập để sử dụng Ứng dụng ',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.textGrayColor[400]),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'SV',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: AppColors.primaryBlue[500]),
                          ),
                          TextSpan(
                            text: 'Care',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: AppColors.primaryGreen[500]),
                          ),
                        ]
                      )
                  ),
                ),
                SizedBox(height: 24),
                NormalButton(
                  child: Text(
                    AppStrings.login, 
                    style: AppStyles.textTheme.titleLarge!.copyWith(
                      color: AppColors.textWhite,
                    ),
                  ),
                  radius: 8,
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true)
                      .pushNamedAndRemoveUntil(PageRoutes.login, (_) => false);
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}