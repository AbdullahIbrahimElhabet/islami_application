import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  void changeTheme(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }

  String changeBackGroundImage() {
    return themeMode == ThemeMode.light
        ? "assets/images/home_screen.png"
        : "assets/images/background_dark.png";
  }
}
