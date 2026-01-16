import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/theme/colors.dart';
import 'package:flutter_base_architecture/theme/styles.dart';
import 'package:flutter_base_architecture/utils/extensions/context_extension.dart';
import 'package:flutter_base_architecture/widgets/button_with_border.dart';
import 'package:flutter_base_architecture/widgets/general_input_field.dart';
import 'package:provider/provider.dart';

import 'component/component.dart';
import 'forgot_password.dart';
import 'forgot_password_view_model.dart';


showDialogChangePassword({required BuildContext context}) {
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
        height: 470 + MediaQuery.of(context).viewInsets.bottom,
        child: DialogChangePassword(context: context),
      );
    },
  );
}

class DialogChangePassword extends StatefulWidget {
  final BuildContext context;
  const DialogChangePassword({Key? key, required this.context}) : super(key: key);

  @override
  State<DialogChangePassword> createState() => _DialogChangePasswordState();
}

class _DialogChangePasswordState extends State<DialogChangePassword> {
  @override
  Widget build(BuildContext context) {
    final viewModel = widget.context.watch<ForgotPasswordViewModel>();
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
              "Đổi lại mật khẩu",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.textGrayColor[800]
              ),
            ),
            SizedBox(height: 24),
            buildNameField(displayText: "Mật khẩu"),
            SizedBox(height: 8),
            GeneralInputField(
              controller: viewModel.passwordFieldController,
              hint: "Nhập mật khẩu",
              textCapital: TextCapitalization.none,
              obscureText1: true,
              onChanged: (value) {
                viewModel.onChangedPassword(value);
                viewModel.user.password = value;
                setState(() {});
              },
              validator: viewModel.validatePassword,
            ),
            SizedBox(height: 16),
            buildNameField(displayText: "Nhập lại mật khẩu"),
            SizedBox(height: 8),
            GeneralInputField(
              controller: viewModel.rePasswordFieldController,
              hint: "Nhập lại mật khẩu",
              textCapital: TextCapitalization.none,
              obscureText1: true,
              validator: viewModel.validateRePassword,
              onChanged: (value) {
                viewModel.user.rePassword = value;
                setState(() {});
              },
            ),
            SizedBox(height: 8),
            StreamBuilder<String>(
              stream: viewModel.passwordSubject.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPasswordAtleast8Character(snapshot.requireData),
                      SizedBox(height: 8),
                      _buildContainNumberUpperCaseLowerCase(snapshot.requireData)
                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPasswordAtleast8Character(""),
                      SizedBox(height: 8),
                      _buildContainNumberUpperCaseLowerCase("")
                    ],
                  );
                }
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
              onPressed: (viewModel.passwordFieldController.text.isEmpty || viewModel.rePasswordFieldController.text.isEmpty) || viewModel.isLoading ? null : () {
                if (viewModel.validate()) {
                  showConfirmDialog(
                    context: context, 
                    onConfirm: () {
                      viewModel.forgotPassword().then((value) {
                        if (value) {
                          showSuccessfulDialog(context: context);
                        } else {
                          Navigator.pop(context);
                        }
                      });
                    }
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildPasswordAtleast8Character(String password) {
    bool check = password.length >= 8;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.check,
          size: 18,
          color: check 
          ? AppColors.primaryBlue[500]
          : AppColors.textGrayColor[500],
        ),
        SizedBox(width: 8),
        SizedBox(
          width: MediaQuery.of(context).size.width - 58,
          child: Text(
            "Mật khẩu phải có ít nhất 8 ký tự",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: check 
              ? AppColors.primaryBlue[500]
              : AppColors.textGrayColor[500],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContainNumberUpperCaseLowerCase(String value) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*\d)(?!.*\s)');
    bool check = regex.hasMatch(value);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.check,
          size: 18,
          color: check 
          ? AppColors.primaryBlue[500]
          : AppColors.textGrayColor[500],
        ),
        SizedBox(width: 8),
        SizedBox(
          width: MediaQuery.of(context).size.width - 58,
          child: Text(
            "Bao gồm số, chữ viết hoa, chữ viết thường",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: check 
              ? AppColors.primaryBlue[500]
              : AppColors.textGrayColor[500],
            ),
          ),
        )
      ],
    );
  }
}

void showConfirmDialog({required BuildContext context, required Null Function() onConfirm}) {
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
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 35,
                    child: Text(
                      "Xác nhận đổi mật khẩu?",
                      style: TextStyle(
                        color: AppColors.primaryBlue[500],
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
                  'Bạn có chắc chắn xác nhận mật khẩu vừa đổi không?',
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
                          "Hủy", 
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
                          "Xác nhận", 
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
