import 'package:flutter/material.dart';
import 'package:islami_refresh/hadeth_tab.dart';
import 'package:islami_refresh/quran/quran_tab.dart';
import 'package:islami_refresh/radio_tab.dart';
import 'package:islami_refresh/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String screenName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

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
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (int index) {
              currentIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/ic_quran.png")),
                  label: "Quran",
                  backgroundColor: Theme.of(context).primaryColor),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/ic_hadeth.png")),
                  label: "Hadeeth",
                  backgroundColor: Theme.of(context).primaryColor),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/ic_sebha.png")),
                  label: "Sebha",
                  backgroundColor: Theme.of(context).primaryColor),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/ic_radio.png")),
                  label: "Radio",
                  backgroundColor: Theme.of(context).primaryColor),
            ],
          ),
          body: tabs[currentIndex],
        )
      ],
    );
  }

  List<Widget> tabs = [QuranTab(), HadethTab(), SebhaTab(), RadioTab()];
}
