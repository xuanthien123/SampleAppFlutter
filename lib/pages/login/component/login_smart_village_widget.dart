import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/res.dart';
import 'package:flutter_base_architecture/theme/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../login_view_model.dart';
import 'component.dart';

class LoginSmartVillageWidget extends StatefulWidget {
  BuildContext context;
  LoginSmartVillageWidget({Key? key, required this.context}) : super(key: key);

  @override
  State<LoginSmartVillageWidget> createState() =>
      _LoginSmartVillageWidgetState();
}

class _LoginSmartVillageWidgetState extends State<LoginSmartVillageWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final viewModel = widget.context.watch<LoginViewModel>();

    return Container(
      width: size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(top: 25),
            child: Image.asset(
              Res.logo_smart_village,
              height: 100,
            ),
          ),
          FormInputSmartVillageWidget(context: widget.context),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              if (viewModel.isCheckValidateXTM()) {
                viewModel.loginXTM();
              }
            },
            child: Container(
                width: size.width,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    'Đăng nhập',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColors.textWhite,
                        fontWeight: FontWeight.w500),
                  ),
                )),
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
