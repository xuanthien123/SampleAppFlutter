import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_architecture/repository/login_repository.dart';
import 'package:flutter_base_architecture/theme/colors.dart';
import 'package:flutter_base_architecture/theme/styles.dart';
import 'package:flutter_base_architecture/utils/extensions/context_extension.dart';
import 'package:flutter_base_architecture/widgets/button_with_border.dart';
import 'package:flutter_base_architecture/widgets/general_input_field.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import 'component/component.dart';
import 'forgot_password_view_model.dart';
import 'show_dialog_otp.dart';


showDialogForgotPassword({required BuildContext context}) {
  return showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    isScrollControlled: true,
    builder: (context) {
      return ChangeNotifierProvider(
        create: (context) => ForgotPasswordViewModel(repository: context.read<LoginRepository>()),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.linear,
          height: 369 + MediaQuery.of(context).viewInsets.bottom,
          child: ForgotPasswordScreen(context: context),
        )
      );
    },
  );
}

class ForgotPasswordScreen extends StatefulWidget {
  final BuildContext context;
  const ForgotPasswordScreen({Key? key, required this.context}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
    final viewModel = context.watch<ForgotPasswordViewModel>();
    return InkWell(
      highlightColor: null,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () => context.hideKeyboard(),
      child: Container(
        width: context.width,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBackButton(context),
            SizedBox(height: 19),
            Text(
              "Bạn không nhớ mật khẩu?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.textGrayColor[800]
              ),
            ),
            SizedBox(height: 8),
            _buildTextForgotPassword(),
            SizedBox(height: 24),
            buildNameField(displayText: "Số điện thoại"),
            SizedBox(height: 8),
            GeneralInputField(
              controller: viewModel.phoneFieldController,
              hint: "Nhập số điện thoại",
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^[0-9]{0,10}'))],
              validator: viewModel.validatePhone,
              onChanged: (value) {
                viewModel.user.phoneNumber = value;
                setState(() {});
              },
            ),
            SizedBox(height: 40),
            NormalButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 25),
                  Text(
                    "Tiếp tục", 
                    style: AppStyles.textTheme.titleLarge!.copyWith(
                      color: AppColors.textWhite,
                    ),
                  ),
                  SizedBox(width: 5),
                  viewModel.isLoading 
                  ? SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: AppColors.primaryBlue[400],strokeWidth: 3))
                  : SizedBox(width: 20),
                ],
              ),
              radius: 8,
              onPressed: (viewModel.phoneFieldController.text.length) < 9 || viewModel.isLoading ? null : () {
                setState(() {});
                viewModel.checkPhoneNumber().then((value) {
                  if (value) {
                    showDialogOtp(context: context);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

_buildTextForgotPassword() {
  return Text(
    "Bạn đừng lo, vui lòng cho chúng tôi thông tin để lấy lại mật khẩu nhé!",
    style: TextStyle(
        fontSize: 14,
        color: AppColors.textGrayColor[500],
        fontWeight: FontWeight.w400),
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
