import 'package:flutter/material.dart';

class LoadingSpinner extends StatelessWidget {
  LoadingSpinner(
      {
      this.color = const Color(0xff1f7b76)});

  final Color color;

  @override
  Widget build(BuildContext context) {
    var bodyProgress = Container(
      height: 40,
      width: 40,
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(color),
        value: null,
        strokeWidth: 3.0,
      ),
    );
    return bodyProgress;
  }
}
