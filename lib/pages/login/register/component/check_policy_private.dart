import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/pages/login/register/register_view_model.dart';
import 'package:flutter_base_architecture/theme/colors.dart';
import 'package:flutter_base_architecture/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';

class BuildCheckPolicyPrivate extends StatefulWidget {
  const BuildCheckPolicyPrivate({Key? key}) : super(key: key);

  @override
  State<BuildCheckPolicyPrivate> createState() => _BuildCheckPolicyPrivateState();
}

class _BuildCheckPolicyPrivateState extends State<BuildCheckPolicyPrivate> {
  bool isSaveAccount = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.contains(MaterialState.disabled)) {
      return Colors.grey;
    }
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return AppColors.primaryBlue;
  }
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<RegisterViewModel>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: SizedBox(
            width: 16,
            height: 16,
            child: Checkbox(
              side: BorderSide(width: 1.13 ,color: AppColors.textGrayColor),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.5))),
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(
                  getColor),
              value: isSaveAccount,
              onChanged: (bool? value) {
                viewModel.isCheckPrivatePolicy = value!;
                setState(() {
                  isSaveAccount = value;
                });
              },
            ),
          ),
        ),
        SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              isSaveAccount = !isSaveAccount;
              viewModel.isCheckPrivatePolicy = isSaveAccount;
            });
          },
          child: SizedBox(
            width: context.width - 56,
            child: RichText(
                text: TextSpan(
                    text: "Điều khoản bảo mật (Các điều khoản bảo mật nhằm bảo mật thông tin cá nhân người dùng, tuân thủ luật pháp.)",
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textGrayColor[500],
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' *',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColors.errorColor[500]),
                      ),
                    ]
                )
            ),
          ),
        ),
      ],
    );
  }
}