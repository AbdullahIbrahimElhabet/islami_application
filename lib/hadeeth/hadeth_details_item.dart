import 'package:flutter/material.dart';

class HadethDetailsItems extends StatelessWidget {
  String hadeth;

  HadethDetailsItems(this.hadeth);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24),
      child: Text(
        hadeth,
        textDirection: TextDirection.rtl,
        style: Theme.of(context).textTheme.subtitle1,
        textAlign: TextAlign.center,
      ),
    );
  }
}
