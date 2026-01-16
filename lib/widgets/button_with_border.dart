import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/res.dart';
import 'package:flutter_base_architecture/theme/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final bool isSelected;
  final double radius;

  const CustomOutlinedButton(
      {Key? key,
      this.onPressed,
      required this.child,
      this.padding = const EdgeInsets.symmetric(horizontal: 0),
      this.isSelected = false,
      this.radius = 4.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor:
              isSelected ? Colors.white : Colors.white,
          padding: padding,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
          side: BorderSide(
              width: 1,
              color: isSelected
                  ? AppColors.primaryGreen
                  : AppColors.textWhite),
        ),
        child: child);
  }
}

class NormalButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;
  double? width;
  final Color buttonColor;

  NormalButton(
      {Key? key,
      this.onPressed,
      required this.child,
      this.padding = const EdgeInsets.symmetric(horizontal: 0),
      this.radius = 4.0,
      this.width,
      this.buttonColor = const Color(0xff1f7b76)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: width ?? size.width,
      height: 43,
      child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            backgroundColor:
                onPressed != null ? buttonColor : AppColors.textGrayColor[100],
            padding: padding,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
            side: BorderSide(
                width: 1,
                color: onPressed != null
                    ? buttonColor
                    : AppColors.textWhite),
          ),
          child: child),
    );
  }
}

