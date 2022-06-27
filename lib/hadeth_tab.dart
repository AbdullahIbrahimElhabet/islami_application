import 'package:flutter/material.dart';

class HadethTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/home_screen.png"),
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Islami", style: Theme.of(context).textTheme.headline1),
          ),
        )
      ],
    );
  }
}
