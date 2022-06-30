import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_refresh/provider/theme_provider.dart';
import 'package:islami_refresh/quran/sura_details_item.dart';
import 'package:provider/provider.dart';

class SuraDetails extends StatefulWidget {
  static const String screenName = "suradie";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArg;
    if (verses.isEmpty) loadFile(args.index);
    return Stack(
      children: [
        Image.asset(
          provider.changeBackGroundImage(),
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              args.suranName,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          body: verses.length == 0
              ? Center(child: CircularProgressIndicator())
              : ListView.separated(
              itemCount: verses.length,
              separatorBuilder: (context, index) {
                return Container(
                  height: 1,
                      color: Theme.of(context).colorScheme.surface,
                      margin: EdgeInsets.symmetric(horizontal: 25),
                    );
              },
              itemBuilder: (context, index) {
                return SuraDetailsItem(verses[index], index + 1);
              }),
        )
      ],
    );
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = content.trim().split("\n");
    verses = lines;
    print(verses);
    setState(() {});
  }
}

class SuraDetailsArg {
  String suranName;
  int index;

  SuraDetailsArg(this.suranName, this.index);
}
