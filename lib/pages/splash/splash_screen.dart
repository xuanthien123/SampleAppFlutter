import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/pages/splash/component/component.dart';
import '../../page_routes.dart';
import '../../theme/colors.dart';
import '../../theme/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, PageRoutes.login);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Container(
        child: Column(
          children: [
            HeaderWidget(),
            RichText(
                text: TextSpan(
                    text: 'SV',
                    style: AppStyles.textTheme.headlineMedium?.copyWith(
                        fontFamily: AppStyles.UTMAptima,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: AppColors.primaryBlue),
                    children: <TextSpan>[
                  TextSpan(
                      text: 'Care',
                      style: AppStyles.textTheme.headlineMedium?.copyWith(
                          fontFamily: AppStyles.UTMAptima,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryGreen)),
                ])),
            Container(
              child: Text(
                'Chăm sóc sức khoẻ người cao tuổi',
                style: AppStyles.titleLarge
                    .copyWith(
                      color: AppColors.textGrayColor[800],
                      fontFamily: AppStyles.UTMAptima,
                    ),
              ),
            ),
            BodyWidget()
          ],
        ),
      ),
    );
  }
}
