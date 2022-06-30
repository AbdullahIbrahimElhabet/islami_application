import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String baseLanguage = "en";

  void changeLanguage(String newLanguage) {
    baseLanguage = newLanguage;
    notifyListeners();
  }
}
