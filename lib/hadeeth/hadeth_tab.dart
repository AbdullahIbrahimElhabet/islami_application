import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_refresh/hadeeth/hadeth_name_item.dart';
import 'package:islami_refresh/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> Ahadeth = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    if (Ahadeth.isEmpty) loadFileHadeth();
    return Stack(
      children: [
        Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("assets/images/head_hadeth.png"),
              Center(
                  child: Text(
                AppLocalizations.of(context)!.ahadeth,
                style: Theme.of(context).textTheme.subtitle2,
              )),
              SizedBox(
                height: 12,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                height: 1,
                color: Theme.of(context).colorScheme.surface,
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(
                child: ListView.separated(
                    itemCount: Ahadeth.length,
                    separatorBuilder: (context, index) {
                      return Container(
                        height: 1,
                        color: Theme.of(context).colorScheme.surface,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                      );
                    },
                    itemBuilder: (context, index) {
                      return HadethNameItem(Ahadeth[index]);
                    }),
              )
            ],
          ),
        )
      ],
    );
  }

  void loadFileHadeth() async {
    String content = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> ahadeth = content.trim().split("#\r\n");

    for (int i = 0; i < ahadeth.length; i++) {
      String hadeeth = ahadeth[i];
      List<String> lines = hadeeth.split("\n");
      String title = lines[0];
      lines.removeAt(0);
      Hadeth hadeth;
      hadeth = Hadeth(title, lines);
      Ahadeth.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;
  List<String> content;

  Hadeth(this.title, this.content);
}
