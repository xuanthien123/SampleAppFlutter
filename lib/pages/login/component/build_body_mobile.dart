import 'dart:io';

import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/pages/home_page.dart';
import 'package:flutter_base_architecture/utils/extensions.dart';
import 'package:provider/provider.dart';

import '../../../res.dart';
import '../../../theme/app_strings.dart';
import '../../../theme/colors.dart';
import '../../../theme/styles.dart';
import '../../../widgets/widget.dart';
import '../forgot_password/forgot_password.dart';
import '../login_view_model.dart';
import '../register/register.dart';
import 'component.dart';

class BuildBodyMobile extends StatefulWidget {
  const BuildBodyMobile({Key? key}) : super(key: key);

  @override
  State<BuildBodyMobile> createState() => _BuildBodyMobileState();
}

class _BuildBodyMobileState extends State<BuildBodyMobile> {
  bool _isCheckExistDevice = false;
  isCheckExistApp() async {
    _isCheckExistDevice = await LaunchApp.isAppInstalled(
        androidPackageName: 'com.nongnghiepso.smartvillage',
        iosUrlScheme: 'smartvillage://');
  }

  openApp() async {
    await LaunchApp.openApp(
      androidPackageName: 'com.nongnghiepso.smartvillage',
      iosUrlScheme: 'smartvillage://',
      appStoreLink:
          'itms-apps://itunes.apple.com/us/app/xã-thông-minh/id1672475638',
      // openStore: false
    );
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final viewModel = context.watch<LoginViewModel>();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          reverse: true,
          child: Container(
            height: size.height,
            child: GestureDetector(
              onTap: () {
                context.hideKeyboard();
              },
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: BackgroundWidget(),
                  ),
                  Container(
                    color: AppColors.textWhite.withOpacity(0.9),
                    child: Column(
                      children: [
                        HeaderWidget(),
                        RichText(
                            text: TextSpan(
                                text: 'SV',
                                style: DefaultTextStyle.of(context)
                                    .style
                                    .copyWith(
                                        fontFamily: AppStyles.UTMAptima,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        color: AppColors.primaryBlue),
                                children: <TextSpan>[
                              TextSpan(
                                  text: 'Care',
                                  style: AppStyles.textTheme.headlineMedium
                                      ?.copyWith(
                                          fontFamily: AppStyles.UTMAptima,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.primaryGreen)),
                            ])),
                        Container(
                          child: Text(
                            'Chăm sóc sức khoẻ người cao tuổi',
                            style: AppStyles.titleLarge.copyWith(
                              color: AppColors.textGrayColor[800],
                              fontFamily: AppStyles.UTMAptima,
                            ),
                          ),
                        ),
                        FormInputWidget(),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          width: size.width,
                          margin: EdgeInsets.only(right: 8),
                          child: InkWell(
                            onTap: () {
                              showDialogForgotPassword(context: context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Quên mật khẩu?',
                                style: AppStyles.textTheme.bodyLarge?.copyWith(
                                    color: AppColors.colorBlue,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 36, 16, 0),
                          child: NormalButton(
                            child: Text(
                              AppStrings.login,
                              style: AppStyles.textTheme.titleLarge!.copyWith(
                                color: AppColors.textWhite,
                              ),
                            ),
                            radius: 8,
                            onPressed: () {
                              if (viewModel.isCheckValidate()) {
                                viewModel.login();
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 5, 16, 0),
                          child: NormalButton(
                            width: context.width * 0.6,
                            buttonColor: AppColors.primaryGreen,
                            child: FittedBox(
                              child: Container(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: Text(
                                  AppStrings.loginWithXTM,
                                  style:
                                      AppStyles.textTheme.titleLarge!.copyWith(
                                    color: AppColors.textWhite,
                                  ),
                                ),
                              ),
                            ),
                            radius: 8,
                            onPressed: () async {
                              await viewModel.checkLoginWithXTM().then((value) {
                                if (viewModel.dataUserXTM.logout == true) {
                                  showAlertDialog(context, widget: LoginSmartVillageWidget(context : context));
                                } else if (viewModel.existAccountXTM?.exists ==
                                        false &&
                                    viewModel.dataUserXTM.logout == false) {
                                  FlushBarUtil.showError(
                                      "Bạn chưa tích hợp tài khoản Xã Thông Minh");
                                  showGeneralDialog(
                                    context: context,
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        RegisterSelectRole(isCheckRegister: false),
                                  );
                                } else if (viewModel.existAccountXTM?.exists ==
                                        true &&
                                    viewModel.dataUserXTM.logout == false){
                                    showAlertDialog(context, widget: AccountUserXTM(context : context));
                                 }
                                else
                                  FlushBarUtil.showSuccess(
                                      "Lỗi gì đó chưa nhìn nhận ra");
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom *
                                  0.2),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10 + context.paddingBottom,
                    right: 0,
                    left: 0,
                    child: Container(
                      width: size.width,
                      alignment: Alignment.center,
                      child: RichText(
                          text: TextSpan(
                              text: 'Bạn chưa có tài khoản?',
                              style: DefaultTextStyle.of(context)
                                  .style
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: AppColors.textGrayColor[800]),
                              children: <TextSpan>[
                            TextSpan(
                                text: ' Đăng ký',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    showGeneralDialog(
                                      context: context,
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          RegisterSelectRole(isCheckRegister: true),
                                    );
                                  },
                                style: AppStyles.textTheme.headlineMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: AppColors.colorBlue)),
                          ])),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
