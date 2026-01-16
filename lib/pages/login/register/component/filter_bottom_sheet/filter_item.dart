import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/theme/colors.dart';

class FilterItem extends StatelessWidget {
  final dynamic item;
  final bool isSelected;
  final Function()? onSelected;

  const FilterItem({Key? key, this.item, this.isSelected = false, this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onSelected,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          margin: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xffF9FAFA)))),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  item.name??item.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: isSelected ? AppColors.primaryBlue[500] : AppColors.textGrayColor[800],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
