import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/res.dart';
import 'package:flutter_base_architecture/theme/colors.dart';
import 'package:flutter_base_architecture/widgets/button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_base_architecture/widgets/container_width_shadow.dart';

class FilterBottomSheet extends StatelessWidget {
  final Widget header;
  final Widget body;
  final Function()? onApply;
  final Function()? onRefresh;

  const FilterBottomSheet({Key? key, required this.header, required this.body, this.onApply, this.onRefresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 68,
            child: ContainerWithShadow.borderRadius(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
                  child: Center(child: header),
                ))),
        SizedBox(
          height: 16,
        ),
        Expanded(
          child: body,
        ),

      ],
    );
  }
}

class FilterBusinessBottomSheet extends StatelessWidget {
  final Widget header;
  final Widget body;
  final Function()? onApply;
  final Function()? onRefresh;

  const FilterBusinessBottomSheet({Key? key, required this.header, required this.body, this.onApply, this.onRefresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 68,
            child: ContainerWithShadow.borderRadius(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
                  child: Center(child: header),
                ))),
        SizedBox(
          height: 16,
        ),
        Expanded(
          child: body,
        ),
         Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          margin: EdgeInsets.only(bottom: 40),
          child: Row(
            children: [
              Expanded(
                  child: CommonButton.accent(
                text: 'Đặt lại',
                onPressed: onRefresh,
              )),
              SizedBox(
                width: 12,
              ),
              Expanded(
                  child: CommonButton(
                text: 'Ok',
                onPressed: onApply,
              ))
            ],
          ),
        )
      ],
    );
  }
}

class RowFilterItem extends StatelessWidget {
  final String title;
  final bool isDisable;
  final Function()? onTap;
  final String? tag;

  const RowFilterItem({Key? key, required this.title, this.isDisable = false, this.onTap, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final disableColor = AppColors.textGrayColor[400];
    return Material(
      child: InkWell(
        onTap: () {
          if (!isDisable) onTap?.call();
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          margin: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xffF9FAFA)))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: isDisable ? disableColor : AppColors.textGrayColor[700],
                        ),
                  ),
                  Spacer(),
                  Text(
                    'Tất cả',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: isDisable ? disableColor : AppColors.textGrayColor[600],
                        ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Icon(
                    Icons.forward_outlined,
                    color: isDisable ? disableColor : AppColors.textGrayColor[600],
                  )
                ],
              ),
              if (tag != null)
                Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      tag ?? '',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: isDisable ? disableColor : AppColors.textGrayColor[500],
                          ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
