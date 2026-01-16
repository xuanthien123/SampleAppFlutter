import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_architecture/pages/login/login_view_model.dart';
import 'package:flutter_base_architecture/theme/colors.dart';
import 'package:flutter_base_architecture/widgets/general_input_field.dart';
import 'package:provider/provider.dart';

import '../../../widgets/widget.dart';

class FormInputSmartVillageWidget extends StatefulWidget {
  BuildContext context;
  FormInputSmartVillageWidget({Key? key, required this.context}) : super(key: key);

  @override
  State<FormInputSmartVillageWidget> createState() => _FormInputSmartVillageWidgetState();
}

class _FormInputSmartVillageWidgetState extends State<FormInputSmartVillageWidget> {
  TextEditingController phoneFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = widget.context.watch<LoginViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(
            height: 26,
          ),
          Form(
            key: viewModel.formKeyPhoneXTM,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: GeneralInputField(
              controller: phoneFieldController,
              focusNode: viewModel.focusPhoneFieldXTM,
              hint: "Nhập số điện thoại",
              textCapital: TextCapitalization.none,
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                viewModel.phoneXTM = value;
              },
              validator: (value) => viewModel.validatePhone(value),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[0-9]{0,}'))
              ],
              prefixIcon: Icon(
                Icons.phone_outlined,
                color: AppColors.textGrayColor[200],
                size: 18,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Form(
            key: viewModel.formKeyPassXTM,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: GeneralInputField(
              controller: passwordFieldController,
              focusNode: viewModel.focusPasswordFieldXTM,
              hint: "Nhập mật khẩu",
              textCapital: TextCapitalization.none,
              obscureText1: true,
              onChanged: (value) {
                viewModel.passwordXTM = value;
              },
              validator: (value) => viewModel.validatePassword(value),
              prefixIcon: Icon(
                Icons.lock_outline,
                color: AppColors.textGrayColor[200],
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
