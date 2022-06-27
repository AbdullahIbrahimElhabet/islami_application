import 'package:flutter/material.dart';
import 'package:islami_refresh/home_screen.dart';
import 'package:islami_refresh/my_theme.dart';
import 'package:islami_refresh/quran/sura_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Islami App",
      routes: {
        HomeScreen.screenName: (context) => HomeScreen(),
        SuraDetails.screenName: (context) => SuraDetails()
      },
      initialRoute: HomeScreen.screenName,
      theme: MyTheme.ligthTheme,
    );
  }
}
