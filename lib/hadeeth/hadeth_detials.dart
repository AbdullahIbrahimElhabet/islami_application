import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_refresh/hadeeth/hadeth_details_item.dart';
import 'package:islami_refresh/hadeeth/hadeth_tab.dart';
import 'package:islami_refresh/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class HadethDetails extends StatelessWidget {
  static const screenName = "hadeth";
  List<String> hadeth = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    hadeth = args.content;
    return Stack(children: [
      Image.asset(
        provider.changeBackGroundImage(),
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      ),
      Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(AppLocalizations.of(context)!.islami,
                style: Theme.of(context).textTheme.headline1),
          ),
          body:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Text(
              args.title,
              style:
                  Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 28),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: hadeth.length,
                  itemBuilder: (context, index) {
                    return HadethDetailsItems(hadeth[index]);
                  }),
            )
          ]))
    ]);
  }
}
