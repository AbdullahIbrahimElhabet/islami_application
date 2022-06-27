import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
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
