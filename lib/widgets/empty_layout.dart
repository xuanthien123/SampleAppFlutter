import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/theme/colors.dart';
import 'package:flutter_base_architecture/theme/styles.dart';

class EmptyLayout extends StatelessWidget {
  final String? title;
  Function()? onTap;

  EmptyLayout({Key? key, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: AppColors.textGrayColor[200]),
            width: 150,
            child: Icon(Icons.hourglass_empty_rounded)),
        SizedBox(
          height: 24,
        ),
        Text(
          title ?? 'Không có dữ liệu phù hợp',
          style: AppStyles.textTheme.bodyLarge
              ?.copyWith(color: AppColors.textGrayColor[500]),
        ),
        SizedBox(
          height: 10,
        ),
        if(onTap != null) GestureDetector(
            onTap: onTap,
            child: Container(padding: EdgeInsets.all(7),decoration: BoxDecoration(color: Colors.grey.shade300,borderRadius: BorderRadius.all(Radius.circular(4))),child: Text('Thử lại', style: AppStyles.textTheme.bodyLarge!.copyWith(color: AppColors.textGrayColor[800], fontSize: 14))))
      ],
    );
  }
}