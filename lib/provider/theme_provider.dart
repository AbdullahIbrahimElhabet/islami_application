import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  void changeTheme(ThemeMode mode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    themeMode = mode;
    prefs.setString("theme", mode == ThemeMode.light ? "ligth" : "dark");
    notifyListeners();
  }

  String changeBackGroundImage() {
    return themeMode == ThemeMode.light
        ? "assets/images/home_screen.png"
        : "assets/images/background_dark.png";
  }
}
