import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContainerWithShadow extends StatelessWidget {
  final Widget child;
  final BorderRadiusGeometry? borderRadius;

  const ContainerWithShadow({Key? key, required this.child})
      : borderRadius = null,
        super(key: key);

  const ContainerWithShadow.borderRadius({Key? key, required this.child, this.borderRadius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFFFFFFFF), borderRadius: borderRadius, boxShadow: [
        BoxShadow(
          color: Color(0xFF222A24).withOpacity(0.08),
          blurRadius: 10,
          offset: Offset(0, 0), // changes position of shadow
        ),
      ]),
      child: child,
    );
  }
}
