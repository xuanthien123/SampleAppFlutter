import 'package:flutter/material.dart';

import 'bottom_sheet_widget.dart';

class PercentBottomSheet {
  static Future<T?> show<T>(
    BuildContext context,
    Widget child, {
    double percent = 0.5,
    bool useRootNavigator = true,
    bool flexibleHeight = false,
  }) {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        isScrollControlled: true,
        useRootNavigator: useRootNavigator,
        builder: (builder) => BottomSheetWidget(
              paddingTop: MediaQuery.of(context).padding.top,
              child: child,
              rate: percent,
              flexibleHeight: flexibleHeight,
            ));
  }
}
