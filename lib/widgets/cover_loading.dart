import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../res.dart';
import 'widget.dart';

class CoverLoading extends StatelessWidget {
  final Widget child;
  final bool showLoading;
  final String image;
  final bool isListLoad;
  final bool isBackground;

  const CoverLoading(
      {Key? key,
      this.showLoading = false,
      required this.child,
      this.image = Res.loading_summary,
      this.isListLoad = false,
      this.isBackground = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        showLoading && isBackground
            ? (isListLoad
                ? Container(
                    padding: EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width,
                    child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Image.asset(image, fit: BoxFit.fill)),
                  )
                : Center(
                    child: LoadingSpinner(),
                  ))
            : SizedBox(),
        Container(child: child),
        showLoading && !isBackground
            ? (isListLoad
                ? Container(
                    padding: EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width,
                    child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Image.asset(image, fit: BoxFit.fill)),
                  )
                : Center(
                    child: LoadingSpinner(),
                  ))
            : SizedBox(),
      ],
    );
  }
}
