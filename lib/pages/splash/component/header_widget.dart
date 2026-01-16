
import 'package:flutter/material.dart';

import '../../../res.dart';
import 'package:flutter_svg/svg.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: SvgPicture.asset(
          Res.main_logo,
          height: size.height / 2.5,
        ));
  }
}