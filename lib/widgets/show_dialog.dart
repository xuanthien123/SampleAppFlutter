// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../res.dart';
import '../theme/colors.dart';

Future<void> showAlertDialog(
  BuildContext context1, {
  required Widget widget,
  final Function()? onPressed,
}) {
  return showDialog<void>(
    context: context1,
    builder: (BuildContext context) => AlertDialog(
        insetPadding: EdgeInsets.all(10),
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: widget),
  );
}
