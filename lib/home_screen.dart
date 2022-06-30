import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_refresh/hadeeth/hadeth_tab.dart';
import 'package:islami_refresh/provider/theme_provider.dart';
import 'package:islami_refresh/quran/quran_tab.dart';
import 'package:islami_refresh/radio_tab.dart';
import 'package:islami_refresh/sebha_tab.dart';
import 'package:islami_refresh/setting/setting_tab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String screenName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Stack(
      children: [
        Image.asset(
          provider.changeBackGroundImage(),
        ),
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(AppLocalizations.of(context)!.islami,
                style: Theme.of(context).textTheme.headline1),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (int index) {
              currentIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/ic_quran.png")),
                  label: AppLocalizations.of(context)!.quran,
                  backgroundColor: Theme.of(context).primaryColor),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/ic_hadeth.png")),
                  label: AppLocalizations.of(context)!.hadeth,
                  backgroundColor: Theme.of(context).primaryColor),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/ic_sebha.png")),
                  label: AppLocalizations.of(context)!.sebha,
                  backgroundColor: Theme.of(context).primaryColor),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/ic_radio.png")),
                  label: AppLocalizations.of(context)!.radio,
                  backgroundColor: Theme.of(context).primaryColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.settings,
                  backgroundColor: Theme.of(context).primaryColor),
            ],
          ),
          body: tabs[currentIndex],
        )
      ],
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingTab()
  ];
}
