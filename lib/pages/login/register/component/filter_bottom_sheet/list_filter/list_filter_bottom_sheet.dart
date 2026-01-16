import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/theme/colors.dart';
import 'package:flutter_base_architecture/widgets/cover_loading.dart';
import 'package:flutter_base_architecture/widgets/empty_layout.dart';
import 'package:flutter_base_architecture/widgets/search_bar.dart';
import 'package:tuple/tuple.dart';
import 'package:provider/provider.dart';

import '../filter_bottom_sheet.dart';
import '../filter_item.dart';
import 'list_filter_view_model.dart';

class ListFilterBottomSheet extends StatelessWidget {
  final String title;
  final String? searchHint;
  final bool hasBackIcon;
  final bool hasSearchInput;

  const ListFilterBottomSheet(
      {Key? key,
      required this.title,
      this.hasBackIcon = true,
      this.searchHint,
      this.hasSearchInput = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ListFilterViewModel>();
    return CoverLoading(
      isBackground: false,
      showLoading: viewModel.isLoading,
      child: FilterBottomSheet(
        header: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (hasBackIcon)
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_outlined, color: AppColors.textGrayColor[500])),
            // if (hasBackIcon)
            //   SizedBox(
            //     width: MediaQuery.of(context).size.width / 5.5,
            //   ),
            Text(title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textGrayColor[700],
                    fontSize: 16)),
            SizedBox(
                width: 30,
              ),
          ],
        ),
        body: Column(
          children: [
            if (hasSearchInput)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SearchBar(
                  hintText: searchHint ?? '',
                  onSearchChange: (value) {
                    viewModel.onSearchChange(value);
                  },
                ),
              ),
            Expanded(
              child: viewModel.items.isEmpty && !viewModel.isLoading
                ? EmptyLayout(title: "Không có dữ liệu",)
                : ListView.builder(
                itemBuilder: (_, index) {
                  return FilterItem(
                    onSelected: () {
                      viewModel.updateSelection = viewModel.items[index];
                      Navigator.pop(context, Tuple2(0, viewModel.selectedItem));
                    },
                    item: viewModel.items[index],
                    isSelected:
                        viewModel.items[index].id == viewModel.selectedItem?.id,
                  );
                },
                itemCount: viewModel.items.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
