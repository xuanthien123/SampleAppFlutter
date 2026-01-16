import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/theme/colors.dart';

Widget buildNameField({required String displayText, bool isRequired = true}) {
    return RichText(
        text: TextSpan(
            text: displayText,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColors.textGrayColor[800]),
            children: <TextSpan>[
              if (isRequired)
              TextSpan(
                text: ' *',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.errorColor[500]),
              ),
            ]
        )
    );
  }