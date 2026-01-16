import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_architecture/theme/colors.dart';

class GeneralInputField extends StatefulWidget {
  final TextEditingController controller;
  final String? hint;
  final Widget? suffixIcon;
  final bool obscureText1;
  final TextInputType? keyboardType;
  final double? width;
  final Function()? onTap;
  final Function(String)? onChanged;
  final bool readOnly;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapital;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  const GeneralInputField(
      {Key? key,
      required this.controller,
      this.hint,
      this.keyboardType,
      this.suffixIcon,
      this.obscureText1 = false,
      this.width,
      this.onTap,
      this.onChanged,
      this.readOnly = false,
      this.focusNode,
      this.inputFormatters,
      this.textCapital = TextCapitalization.sentences,
      this.prefixIcon,
      this.validator})
      : super(key: key);

  @override
  State<GeneralInputField> createState() => _GeneralInputFieldState();
}

class _GeneralInputFieldState extends State<GeneralInputField> {
  late bool _obscureText1;
  @override
  void initState() {
    // textEditingController.text = widget.value ?? '';
    _obscureText1 = widget.obscureText1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textCapitalization: widget.textCapital,
      focusNode: widget.focusNode,
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
        setState(() {});
      },
      onTap: widget.onTap,
      readOnly: widget.readOnly,
      obscureText: _obscureText1,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      inputFormatters: widget.inputFormatters,
      validator: widget.validator,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
              top: 13,
              left: 0,
              bottom: 13,
              right: widget.obscureText1 ? 0 : 12),
          errorStyle: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: AppColors.errorColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide:
                BorderSide(width: 1, color: AppColors.primaryBlue[500]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
                width: 1.5,
                color: widget.controller.text.isNotEmpty
                    ? AppColors.primaryBlue[500]!
                    : AppColors.textGrayColor[400]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
                width: 1,
                color: widget.controller.text.isNotEmpty
                    ? AppColors.primaryBlue[500]!
                    : AppColors.textGrayColor[200]!),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(width: 1, color: AppColors.errorColor[500]!),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide:
                BorderSide(width: 1, color: AppColors.textGrayColor[400]!),
          ),
          hintText: widget.hint ?? '',
          hintStyle: TextStyle(fontSize: 14, color: Color(0xFFB3B1B1)),
          suffixIcon: widget.obscureText1
              ? InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    setState(() {
                      _obscureText1 = !_obscureText1;
                    });
                  },
                  child: Icon(
                    _obscureText1
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.textGrayColor[200],
                    size: 18,
                  ),
                )
              : widget.suffixIcon ?? null,
          suffixIconConstraints: BoxConstraints(maxHeight: 43, maxWidth: 43, minHeight: 43, minWidth: 43),
          prefixIcon: widget.prefixIcon,
          prefix: widget.prefixIcon != null ? null : const Padding(padding: EdgeInsets.only(left: 12.0)),
          prefixIconConstraints: BoxConstraints(maxHeight: 43, maxWidth: 43, minHeight: 43, minWidth: 43),
          isDense: true,
        ),
    );
  }
}
