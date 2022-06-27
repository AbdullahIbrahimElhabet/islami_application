import 'package:flutter/material.dart';

class SuraDetailsItem extends StatelessWidget {
  String sura;
  int index;

  SuraDetailsItem(this.sura, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        "$sura($index)",
        textDirection: TextDirection.rtl,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
