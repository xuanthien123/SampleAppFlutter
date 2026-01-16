import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color bgColor = Color(0xfff7f7f7);
  static MaterialColor primaryBlue = MaterialColor(
    0xff1f7b76,
    <int, Color>{
      50: Color(0xFFe9f2f1),
      100: Color(0xFFbad6d5),
      200: Color(0xFF98c2c0),
      300: Color(0xFF69a7a3),
      400: Color(0xFF4c9591),
      500: Color(0xff1f7b76),
      600: Color(0xFF1c706b),
      700: Color(0xFF165754),
      800: Color(0xFF114441),
      900: Color(0xFF0d3432),
    },
  );

  static MaterialColor primaryGreen = MaterialColor(
    0xff75b482,
    <int, Color>{
      50: Color(0xFFf1f8f3),
      100: Color(0xFFd4e8d8),
      200: Color(0xFFc0ddc6),
      300: Color(0xFFa3cdab),
      400: Color(0xFF91c39b),
      500: Color(0xff75b482),
      600: Color(0xFF6aa476),
      700: Color(0xFF53805c),
      800: Color(0xFF406348),
      900: Color(0xFF314c37),
    },
  );


  static MaterialColor errorColor = MaterialColor(
    0xffdc3545,
    <int, Color>{
      50: Color(0xFFfcebec),
      100: Color(0xFFf4c0c5),
      200: Color(0xFFefa2a9),
      300: Color(0xFFe87882),
      400: Color(0xFFe35d6a),
      500: Color(0xffdc3545),
      600: Color(0xFFc8303f),
      700: Color(0xFF9c2631),
      800: Color(0xFF791d26),
      900: Color(0xFF5c161d),
    },
  );

  static MaterialColor successColor = MaterialColor(
    0xff0ca65e,
    <int, Color>{
      50: Color(0xFFe7f6ef),
      100: Color(0xFFb4e3cd),
      200: Color(0xFF8fd6b5),
      300: Color(0xFF5cc393),
      400: Color(0xFF3db87e),
      500: Color(0xff0ca65e),
      600: Color(0xFF0b9756),
      700: Color(0xFF097643),
      800: Color(0xFF075b34),
      900: Color(0xFF054627),
    },
  );

  static MaterialColor warningColor = MaterialColor(
    0xFFffc107,
    <int, Color>{
      50: Color(0xFFfff9e6),
      100: Color(0xFFffecb2),
      200: Color(0xFFffe28d),
      300: Color(0xFFffd559),
      400: Color(0xFFffcd39),
      500: Color(0xffffc107),
      600: Color(0xFFe8b006),
      700: Color(0xFFb58905),
      800: Color(0xFF8c6a04),
      900: Color(0xFF6b5103),
    },
  );

  static MaterialColor textGrayColor = MaterialColor(
    0xFF6c757d,
    <int, Color>{
      50: Color(0xFFf0f1f2),
      100: Color(0xFFd1d4d7),
      200: Color(0xFFbbc0c3),
      300: Color(0xFF9da3a8),
      400: Color(0xFF899197),
      500: Color(0xff6c757d),
      600: Color(0xFF626a72),
      700: Color(0xFF4d5359),
      800: Color(0xFF3b4045),
      900: Color(0xFF2d3135),
    },
  );
  static const Color dividerGray = const Color(0xffC2CBD6);
  static const Color iconDefaultColor = const Color(0xff667D99);
  static const Color grey = Color(0xffdbdbdb);
  static const Color textDefault = Color(0xFF3D4B5C);
  static const Color pickerDefaultColor = Color(0xFF262626);
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color accentColor = Color(0xFF2E9E4C);
  static const Color colorLine = Color(0xFFD9DADA);
  static const Color colorBlue = Color(0xFF0085FF);
  static const Color backgroundColorSelectFile = Color.fromRGBO(31, 123, 118, 0.04);

  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}
