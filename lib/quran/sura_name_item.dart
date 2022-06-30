import 'package:flutter/material.dart';
import 'package:islami_refresh/quran/sura_details.dart';

class SuraNamesItem extends StatelessWidget {
  String suranNames;
  int index;

  SuraNamesItem(this.suranNames, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetails.screenName,
            arguments: SuraDetailsArg(suranNames, index));
      },
      child: Container(
        child: Center(
          child: Text(
            suranNames,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
      ),
    );
  }
}
