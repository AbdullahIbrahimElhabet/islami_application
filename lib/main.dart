import 'package:flutter/material.dart';
import 'package:islami_refresh/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Islami App",
      routes: {HomeScreen.screenName: (context) => HomeScreen()},
      initialRoute: HomeScreen.screenName,
    );
  }
}
