import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/res.dart';
import 'package:flutter_base_architecture/theme/colors.dart';
import 'package:flutter_base_architecture/theme/styles.dart';
import 'package:flutter_base_architecture/utils/extensions/context_extension.dart';
import 'package:flutter_base_architecture/widgets/widget.dart';
import 'package:flutter_svg/svg.dart';

void showDialogBackGesture({required BuildContext context, required Null Function() onConfirm}) {
  showDialog(
    context: context,
    useRootNavigator: true,
    builder: (_) {
      return Dialog(
        shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
        insetPadding: EdgeInsets.all(19),
        child: Container(
          width: context.width - 38,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 24),
                  Column(
                    children: [
                      SizedBox(height: 12),
                      SvgPicture.asset(
                        Res.icon_warning_outline,
                        width: 32,
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Bạn muốn thoát trang?",
                        style: TextStyle(
                          color: AppColors.warningColor[600],
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.textGrayColor[50]
                      ),
                      padding: EdgeInsets.all(3),
                      child: Icon(
                        Icons.close,
                        color: AppColors.textGrayColor[800],
                        size: 18,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 16),
              SizedBox(
                width: 274,
                child: Text(
                  'Dữ liệu đang nhập sẽ không được lưu lại, bạn vẫn chắc chắn muốn thoát?',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.textGrayColor[400]),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: context.width / 2 - 43,
                      height: 35,
                      child: NormalButton(
                        child: Text(
                          "Vẫn ở lại", 
                          style: AppStyles.textTheme.titleLarge!.copyWith(
                            color: AppColors.textWhite,
                          ),
                        ),
                        radius: 8,
                        buttonColor: AppColors.textGrayColor[100]!,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    SizedBox(
                      width: context.width / 2 - 43,
                      height: 35,
                      child: NormalButton(
                        child: Text(
                          "Thoát", 
                          style: AppStyles.textTheme.titleLarge!.copyWith(
                            color: AppColors.textWhite,
                          ),
                        ),
                        radius: 8,
                        onPressed: onConfirm,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8)
            ],
          ),
        ),
      );
    },
  );
}
