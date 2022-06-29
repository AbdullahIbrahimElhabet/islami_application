import 'package:flutter/material.dart';
import 'package:islami_refresh/hadeeth/hadeth_detials.dart';
import 'package:islami_refresh/hadeeth/hadeth_tab.dart';

class HadethNameItem extends StatelessWidget {
  Hadeth hadeth;

  HadethNameItem(this.hadeth);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetails.screenName,
            arguments: hadeth);
      },
      child: Container(
        child: Center(
          child: Text(
            hadeth.title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}
