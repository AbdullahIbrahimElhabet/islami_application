import 'package:flutter/material.dart';

class MyTheme {
  static const primaryColor = Color.fromRGBO(183, 147, 95, 1.0);
  static const blackColor = Color.fromRGBO(36, 36, 36, 1.0);
  static ThemeData ligthTheme = ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.transparent,
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
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: blackColor,
        unselectedItemColor: Colors.white,
      ));
}
