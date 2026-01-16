import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/page_routes.dart';
import 'package:flutter_base_architecture/res.dart';
import 'package:flutter_base_architecture/theme/colors.dart';
import 'package:flutter_base_architecture/theme/constant.dart';
import 'package:flutter_base_architecture/theme/styles.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/app_strings.dart';
import 'component/component.dart';

class RegisterSelectRole extends StatefulWidget {
  bool isCheckRegister;
  RegisterSelectRole({Key? key, required this.isCheckRegister})
      : super(key: key);

  @override
  State<RegisterSelectRole> createState() => _RegisterSelectRoleState();
}

class _RegisterSelectRoleState extends State<RegisterSelectRole> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    size: 24,
                    color: AppColors.textGrayColor[800],
                  )),
              registerText(context, ''),
              _selectRole(context)
            ],
          ),
        ),
      )),
    );
  }

  Widget _selectRole(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              text: TextSpan(
                  text: 'Bạn dùng ứng dụng với vai trò là? ',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.textGrayColor[800]),
                  children: <TextSpan>[
                TextSpan(
                  text: '*',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.errorColor[500]),
                ),
              ])),
          SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            // padding: EdgeInsets.all(16),
            childAspectRatio: 1,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(PageRoutes.register, arguments: {
                    AppStrings.TYPE_ACCOUNT: Constant.ELDERLY_INDEX,
                    AppStrings.IS_REGISTER: widget.isCheckRegister
                  }).then((value) {
                    if(!widget.isCheckRegister) Navigator.of(context, rootNavigator: true).pop();
                  } );
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(width: 1, color: AppColors.primaryBlue)),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Res.icon_elderly,
                        width: 88,
                      ),
                      SizedBox(height: 8),
                      Text("Người cao tuổi",
                          style: AppStyles.textTheme.titleLarge)
                    ],
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(PageRoutes.register, arguments: {
                    AppStrings.TYPE_ACCOUNT: Constant.BUCKLER_INDEX,
                    AppStrings.IS_REGISTER: widget.isCheckRegister
                  }).then((value) {
                    if(!widget.isCheckRegister) Navigator.of(context, rootNavigator: true).pop();
                  } );
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(width: 1, color: AppColors.primaryBlue)),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Res.icon_buckler,
                        width: 88,
                      ),
                      SizedBox(height: 8),
                      Text("Người bảo trợ",
                          style: AppStyles.textTheme.titleLarge)
                    ],
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(PageRoutes.register, arguments: {
                    AppStrings.TYPE_ACCOUNT: Constant.MEDICAL_STAFF_INDEX,
                    AppStrings.IS_REGISTER: widget.isCheckRegister
                  }).then((value) {
                    if(!widget.isCheckRegister) Navigator.of(context, rootNavigator: true).pop();
                  } );
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(width: 1, color: AppColors.primaryBlue)),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Res.icon_medical_staff,
                        width: 88,
                      ),
                      SizedBox(height: 8),
                      Text("Cán bộ Y Tế", style: AppStyles.textTheme.titleLarge)
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
