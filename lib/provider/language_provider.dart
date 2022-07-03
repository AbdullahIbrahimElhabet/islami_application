import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  String baseLanguage = "en";

  void changeLanguage(String newLanguage) async {
    baseLanguage = newLanguage;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("lang", newLanguage);
    notifyListeners();
  }
}
