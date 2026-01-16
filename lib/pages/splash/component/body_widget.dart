import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../res.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: SvgPicture.asset(
          Res.bot_splash,
          height: size.height / 2.5,
        )));
  }
}
