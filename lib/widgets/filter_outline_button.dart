import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/theme/colors.dart';
import 'package:flutter_base_architecture/theme/styles.dart';
import 'package:flutter_base_architecture/utils/extensions.dart';


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
                  ? AppColors.textGrayColor[200]!
                  : AppColors.textGrayColor[200]!),
        ),
        child: child);
  }
}

class FilterOutlinedButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final bool isSelected;
  final bool isDisable;
  final String? content;
  final String? errorText;

  const FilterOutlinedButton(
      {Key? key,
      this.onPressed,
      this.isSelected = false,
      this.content,
      this.isDisable = false,
      this.errorText})
      : super(key: key);

  @override
  State<FilterOutlinedButton> createState() => _FilterOutlinedButtonState();
}

class _FilterOutlinedButtonState extends State<FilterOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: widget.onPressed,
          child: Container(
            height: 43,
            width: context.width,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 1, 
                color: widget.errorText != null 
                  ? AppColors.errorColor[500]! 
                  : widget.isSelected == false
                    ? widget.isDisable ? AppColors.textGrayColor[200]! : AppColors.textGrayColor[500]!
                    : AppColors.primaryBlue[500]!
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.content ?? "",
                  style: AppStyles.textTheme.bodyLarge!.copyWith(
                    color: widget.isSelected == false 
                    ? widget.isDisable ? AppColors.textGrayColor[200]! : AppColors.textGrayColor[500]!
                    : AppColors.textGrayColor[800]
                  )
                ),
                Icon(
                  Icons.arrow_drop_down,
                  size: 18,
                  color: widget.isDisable ? AppColors.textGrayColor[200]! : AppColors.textGrayColor[500]!
                )
              ],
            )
          ),
        ),
        if (widget.errorText != null)
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8,),
            Text(
              widget.errorText!,
              style: TextStyle(
                color: AppColors.errorColor[500],
                fontSize: 12,
              ),
            )
          ],
        )
      ],
    );
  }
}