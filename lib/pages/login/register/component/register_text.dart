import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/theme/colors.dart';

Widget registerText(BuildContext context, String role) {
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Đăng ký tài khoản $role",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20
          ),
        ),
        SizedBox(height: 8),
        RichText(
          text: TextSpan(
              text: 'Chào mừng bạn tới ',
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
                TextSpan(
                  text: ', những chức năng bổ ích tốt cho sức khỏe đang chờ đợi bạn.',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.textGrayColor[400]),
                ),
              ]
            )
        ),
      ],
    ),
  );
}