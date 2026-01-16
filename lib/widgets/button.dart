import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/res.dart';
import 'package:flutter_base_architecture/theme/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double radius;
  final bool isEnable;
  final double verticalPadding;
  final double horizontalPadding;
  final bool _isAccentButton;
  final bool hasNextButton;
  final double? width;
  final double? height;

  const CommonButton({Key? key, required this.text, this.onPressed, this.isEnable = true, this.hasNextButton = false, this.height, this.width})
      : verticalPadding = 10,
        radius = 8,
        horizontalPadding = 24,
        _isAccentButton = false,
        super(key: key);

  const CommonButton.accent({Key? key, required this.text, this.onPressed, this.isEnable = true, this.hasNextButton = false, this.height, this.width})
      : verticalPadding = 10,
        radius = 8,
        horizontalPadding = 24,
        _isAccentButton = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 46,
      width: width,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(!isEnable
                ? AppColors.textGrayColor[200]!
                : _isAccentButton
                    ? AppColors.primaryBlue[200]!
                    : AppColors.primaryBlue),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)))),
        child: Row(
          children: [
            if (hasNextButton)
              SizedBox(
                width: 24,
              ),
            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: !isEnable
                            ? AppColors.textGrayColor[500]!
                            : _isAccentButton
                                ? AppColors.primaryBlue[500]
                                : Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                ),
              ),
            ),
            // if (hasNextButton)
            //   SvgPicture.asset(
            //     Res.ic_next,
            //     // width: 10,
            //     height: 10,
            //   ),
          ],
        ),
      ),
    );
  }
}
