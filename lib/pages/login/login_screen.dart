import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/base/base_widget.dart';
import 'package:flutter_base_architecture/pages/home_page.dart';
import 'package:flutter_base_architecture/pages/login/component/component.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../../enum/message_status.dart';
import '../../widgets/widget.dart';
import 'login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ResponsiveWidget {
  StreamSubscription<dynamic>? _stream;

  @override
  void initState() {
    _stream =
        context.read<LoginViewModel>().messageStream.listen((event) async {
      if (event is Tuple2<MessageStatus, dynamic>) {
        switch (event.item1) {
          case MessageStatus.Warning:
            break;
          case MessageStatus.Error:
            break;
          case MessageStatus.Success:
            Navigator.of(context, rootNavigator: true).pop();
            showAlertDialog(context, widget: AccountUserXTM(context: context));
            break;
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _stream?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildUi(context: context);
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return SizedBox();
  }

  @override
  Widget buildMobile(BuildContext context) {
    return BuildBodyMobile();
  }

  @override
  Widget buildTablet(BuildContext context) {
    return BuildBodyMobile();
  }
}
