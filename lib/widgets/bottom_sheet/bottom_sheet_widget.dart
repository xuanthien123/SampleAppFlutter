import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  final double paddingTop;
  final double rate;
  final Widget child;
  final bool flexibleHeight;

  const BottomSheetWidget({Key? key, required this.child, this.rate = 0.5, this.flexibleHeight = false, this.paddingTop = 24}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        behavior: HitTestBehavior.translucent,
        child: flexibleHeight
            ? IntrinsicHeight(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    color: Colors.white,
                  ),
                  child: child,
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  color: Colors.white,
                ),
                height: MediaQuery.of(context).size.height - this.paddingTop,
                // padding: MediaQuery.of(context).viewInsets.copyWith(top: MediaQuery.of(context).padding.top),
                child: child,
              ),
      ),
    );
  }
}
