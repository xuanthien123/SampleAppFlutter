import 'package:flutter/material.dart';
import 'colors.dart';

class AppStyles {
  AppStyles._();

  static const Roboto = "Roboto";
  static const UTMAptima = "UTM-Aptima";
  static final boxShadow = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6), topRight: Radius.circular(6)),
      boxShadow: [
        BoxShadow(
            blurRadius: 6,
            offset: Offset(0, 3),
            color: Color.fromRGBO(0, 0, 0, .16))
      ]);
  static const textTheme = TextTheme(
      bodyLarge: const TextStyle(
          fontFamily: Roboto, fontSize: 14, ),
      bodyMedium: const TextStyle(
          fontFamily: Roboto, fontSize: 12, ),
      titleMedium: const TextStyle(
          fontFamily: Roboto, fontSize: 14, ),
      titleSmall: const TextStyle(
          fontFamily: Roboto, fontSize: 12, ),
      bodySmall: const TextStyle(
          fontFamily: Roboto, fontSize: 10,),
      titleLarge: const TextStyle(
          fontFamily: Roboto,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          ),
      headlineSmall: const TextStyle(
          fontFamily: Roboto,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          ),
      headlineMedium: const TextStyle(
          fontFamily: Roboto,
          fontSize: 24,
          fontWeight: FontWeight.w500,
          ),
      displaySmall: const TextStyle(
          fontFamily: Roboto,
          fontSize: 26,
          fontWeight: FontWeight.w500,
          ),
      displayMedium: const TextStyle(
          fontFamily: Roboto,
          fontSize: 30,
          fontWeight: FontWeight.w900,
          ));

  static const titleLarge =  TextStyle(fontSize: 20, fontWeight: FontWeight.w400);
}
