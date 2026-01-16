import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/res.dart';
import 'package:flutter_base_architecture/theme/colors.dart';
import 'package:flutter_base_architecture/theme/styles.dart';
import 'package:flutter_base_architecture/utils/extensions/context_extension.dart';
import 'package:flutter_base_architecture/widgets/button_with_border.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import 'forgot_password.dart';


showDialogOtp({required BuildContext context}) {
  return showModalBottomSheet(
    barrierColor: Colors.transparent,
    context: context,
    useRootNavigator: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    isScrollControlled: true,
    builder: (_) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.linear,
        height: 369 + MediaQuery.of(context).viewInsets.bottom,
        child: OTPTypeScreen(context: context),
      );
    },
  );
}

class OTPTypeScreen extends StatefulWidget {
  final BuildContext context;
  const OTPTypeScreen({Key? key, required this.context}) : super(key: key);

  @override
  State<OTPTypeScreen> createState() => _OTPTypeScreenState();
}

class _OTPTypeScreenState extends State<OTPTypeScreen> {
  TextEditingController pinController = TextEditingController();
  FocusNode focusNode = FocusNode();
  final defaultPinTheme = PinTheme(
    width: 44,
    height: 44,
    textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: AppColors.textGrayColor[50]
    ),
  );
  @override
  Widget build(BuildContext context) {
    final viewModel = widget.context.watch<ForgotPasswordViewModel>();
    return Container(
      width: context.width,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBackButton(context),
          SizedBox(height: 19),
          Text(
            "Nhập mã OTP",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.textGrayColor[800]
            ),
          ),
          SizedBox(height: 8),
          _buildTextSentOTP("${viewModel.phoneFieldController.text}"),
          SizedBox(height: 27),
          Pinput(
            length: 6,
            defaultPinTheme: defaultPinTheme,
            controller: pinController,
            focusNode: focusNode,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            focusedPinTheme: PinTheme(
              width: 44,
              height: 44,
              textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.textGrayColor[50],
                border: Border.all(
                  color: AppColors.primaryBlue[500]!,
                  width: 1.5
                )
              ),
            ),
            submittedPinTheme: PinTheme(
              width: 44,
              height: 44,
              textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.textGrayColor[50],
                border: Border.all(
                  color: AppColors.primaryBlue[500]!,
                  width: 1
                )
              ),
            ),
            cursor: Container(
              height: 20,
              width: 1,
              color: AppColors.primaryBlue[500],
            ),
            // androidSmsAutofillMethod:
            //     AndroidSmsAutofillMethod.smsRetrieverApi,
            listenForMultipleSmsOnAndroid: true,
            validator: (value) {
              return null;
            
              // return value == '2222' ? null : 'Pin is incorrect';
            },
            hapticFeedbackType: HapticFeedbackType.lightImpact,
            onCompleted: (pin) {
              // msmPin = pin;
              // viewModel.otp = pin;
              setState(() {
                
              });
            },
            onChanged: (value) {
              setState(() {
                
              });
              // viewModel.otp = value;
            },
          ),
          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(11),
                onTap: () {
                  viewModel.resetTimer();
                },
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryBlue[500]
                      ),
                      child: SvgPicture.asset(
                        Res.icon_cached,
                        width: 22,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Gửi lại mã",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryBlue[500]
                      ),
                    ),
                    SizedBox(width: 5)
                  ],
                ),
              ),
              StreamBuilder<int>(
                stream: viewModel.timerSubject.stream,
                builder: (context, snapshot) {
                  return RichText(
                    text: TextSpan(
                        text: "Mã sẽ hết hạn ",
                        style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textGrayColor[800],
                            fontWeight: FontWeight.w500),
                        children: <TextSpan>[
                          TextSpan(
                            text: viewModel.intToTimeLeft(snapshot.data??0),
                            style: TextStyle(
                              color: AppColors.primaryBlue[500],
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ]
                    )
                  );
                }
              )
            ],
          ),
          SizedBox(height: 33),
          NormalButton(
            child: Text(
              "Tiếp tục", 
              style: AppStyles.textTheme.titleLarge!.copyWith(
                color: AppColors.textWhite,
              ),
            ),
            radius: 8,
            onPressed: pinController.text.length != 6 ? null : () {
              // TODO
              Navigator.pop(context);
              showDialogChangePassword(context: widget.context);
              
            },
          ),
        ],
      ),
    );
  }
}

_buildTextSentOTP(String value) {
  return RichText(
    text: TextSpan(
        text: "Chúng tôi vừa gửi một mã OTP tới ",
        style: TextStyle(
            fontSize: 14,
            color: AppColors.textGrayColor[500],
            fontWeight: FontWeight.w400),
        children: <TextSpan>[
          TextSpan(
            text: value,
            style: TextStyle(
              color: AppColors.textGrayColor[800],
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: ' mã có hiệu lực ',
            style: TextStyle(
              color: AppColors.textGrayColor[400],
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: '60 giây',
            style: TextStyle(
              color: AppColors.textGrayColor[800],
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ]
    )
  );
}

_buildBackButton(BuildContext context) {
  return Container(
    width: context.width,
    alignment: Alignment.centerRight,
    child: InkWell(
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
    ),
  );
}
