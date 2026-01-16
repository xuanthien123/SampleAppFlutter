import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/theme/colors.dart';

class CustomInputField extends StatefulWidget {
  final inputformat;
  final String? hint;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Function(String)? afterLostFocusChange;
  final FocusNode? focusNode;
  final String? value;
  final Widget? suffixIcon;
  final bool? autoFocus;
  final TextEditingController? textEditingController;
  final Function()? onTap;
  final Widget? prefixIcon;
  const CustomInputField(
      {Key? key,
      this.hint,
      this.obscureText = false,
      this.keyboardType,
      this.onChanged,
      this.focusNode,
      this.value,
      this.afterLostFocusChange,
      this.suffixIcon,
      this.autoFocus,
      this.inputformat,
      this.onTap,
      this.textEditingController, 
      this.prefixIcon})
      : super(key: key);

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  String? _labelText;
  late bool _obscureText;

  @override
  void initState() {
    widget.textEditingController?.text = widget.value ?? '';
    _obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),

      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        onTap: widget.onTap,
        
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.black),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.black),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.black),
            ),
            hintText: widget.hint ?? '',
            hintStyle: TextStyle(
              color: AppColors.textGrayColor[200],
            ),
            suffixIconConstraints: BoxConstraints(maxWidth: 21),
            isDense: true,
            prefixIcon:  widget.prefixIcon,
            suffixIcon: widget.obscureText
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Transform.translate(
                      offset: Offset(-7, 0),
                      child: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: 22),
                    ),
                  )
                : widget.suffixIcon ?? SizedBox()),
        textAlign: TextAlign.start,
        controller: widget.textEditingController,
        obscureText: _obscureText,
        autofocus: widget.autoFocus ?? false,
        focusNode: widget.focusNode,
        inputFormatters: widget.inputformat,
        keyboardType: widget.keyboardType ?? TextInputType.text,
      
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: AppColors.textGrayColor[700], fontSize: 16),
        onChanged: (value) {
          widget.onChanged?.call(value);
          setState(() {
            if (value.isNotEmpty) {
              _labelText = widget.hint;
            } else {
              _labelText = null;
            }
          });
        },
      ),
    );
  }
}
