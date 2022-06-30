import 'package:flutter/material.dart';

class MyTheme {
  static const primaryColor = Color.fromRGBO(183, 147, 95, 1.0);
  static const blackColor = Color.fromRGBO(36, 36, 36, 1.0);
  static const goldColor = Color.fromRGBO(250, 204, 29, 1.0);
  static const primaryDark = Color.fromRGBO(20, 26, 46, 1.0);
  static ThemeData ligthTheme = ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme(
        background: primaryColor,
        brightness: Brightness.light,
        error: Colors.red,
        onBackground: primaryColor,
        onError: Colors.red,
        onSecondary: Colors.white,
        onPrimary: Colors.white,
        onSurface: primaryColor,
        primary: primaryColor,
        secondary: blackColor,
        surface: primaryColor,
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: blackColor)),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: blackColor,
        ),
        subtitle1: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: blackColor,
        ),
        subtitle2: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: blackColor,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: blackColor,
        unselectedItemColor: Colors.white,
      ));
  static ThemeData darkTheme = ThemeData(
      primaryColor: primaryDark,
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme(
        background: primaryDark,
        brightness: Brightness.dark,
        error: Colors.red,
        onBackground: primaryDark,
        onError: Colors.red,
        onSecondary: Colors.white,
        onPrimary: blackColor,
        onSurface: primaryDark,
        primary: primaryDark,
        secondary: goldColor,
        surface: goldColor,
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white)),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        subtitle1: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: goldColor,
        ),
        subtitle2: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: goldColor,
        unselectedItemColor: Colors.white,
      ));
}
