import 'package:flutter/material.dart';
import '../../utils/constants/app_color.dart';

class AppTheme {
  static ThemeData light = ThemeData.light().copyWith(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: AppColors.customThemeColorGraySwatch,
    ),
    scaffoldBackgroundColor:  const Color(0XFFF5F8FE),
    appBarTheme: const AppBarTheme(
      backgroundColor:  Color(0XFFF5F8FE),
    ),
    textTheme: ThemeData.light().textTheme.apply(
      fontFamily: 'Poppins',
      bodyColor: Colors.black,
    ),
  );

  static ThemeData dark = ThemeData.dark().copyWith(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: AppColors.customThemeColorGraySwatch,
    ),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
    textTheme: ThemeData.dark().textTheme.apply(
      fontFamily: 'Poppins',
      // bodyColor: Colors.black,
      // decorationColor: Colors.black
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: Colors.orange.withOpacity(0.3),
      selectionHandleColor: Colors.orange,
    ),

  );

}
