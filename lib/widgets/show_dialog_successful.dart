// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../res.dart';
import '../theme/colors.dart';

Future<void> showAlertDialogSuccessfulTest(
  BuildContext context, {
  String? icon,
  // String title = '',
  final Function()? onPressed,
  String? descrip,

  // required AddOrEditProductLogViewModel viewModel
}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      insetPadding: EdgeInsets.all(40),
      contentPadding: EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),

      icon: Padding(
        padding: const EdgeInsets.only(top: 22),
        child: Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(Res.icon), fit: BoxFit.contain)),
        ),
      ),
      // title: Center(
      //     child: Text(
      //   title,
      //   style: TextStyle(
      //       fontSize: 20,
      //       fontWeight: FontWeight.w700,
      //       color: AppColors.ButtonGreen),
      // )),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onPressed,
            child: Text(
              descrip ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryBlue),
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    ),
  );
}

Future<void> showAlertDialogLocation(BuildContext context,
    {String? icon,
    String title = 'Bật vị trí',
    final Function()? onPressed,
    required String btnConfirm,
    String btnName2 = "Hủy",
    Color? color = const Color(0xffdc3545),
    Color? colorConfirm = const Color(0xFF2d3135)}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      insetPadding: EdgeInsets.all(40),
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      icon: Container(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Res.icon), fit: BoxFit.contain)),
      ),
      title: Padding(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryBlue),
        )),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              margin: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.grey.shade200, width: 1.0)))),
          GestureDetector(
            onTap: onPressed,
            child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(2)),
                child: Text(btnConfirm,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: colorConfirm))),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.grey.shade200, width: 1.0)))),
          GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2)),
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(btnName2,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: color)))))
        ],
      ),
    ),
  );
}
Future<void>  showAlertDialogPermission(BuildContext context,
    {String iconDialog = Res.icon,
    String title = 'Bật vị trí',
    final Function()? onPressed,
    required String btnConfirm,
    String btnName2 = "Hủy",
    Color? color = const Color(0xffdc3545),
    Color? colorConfirm = const Color(0xFF2d3135)}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      insetPadding: EdgeInsets.all(40),
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      icon: Container(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(iconDialog), fit: BoxFit.contain)),
      ),
      title: Padding(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryBlue),
        )),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              margin: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.grey.shade200, width: 1.0)))),
          GestureDetector(
            onTap: onPressed,
            child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(2)),
                child: Text(btnConfirm,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: colorConfirm))),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.grey.shade200, width: 1.0)))),
          GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2)),
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(btnName2,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: color)))))
        ],
      ),
    ),
  );
}
