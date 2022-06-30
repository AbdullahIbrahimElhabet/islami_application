import 'package:flutter/material.dart';
import 'package:islami_refresh/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> tasebeh = [
    "سبحان الله",
    "الحمد لله",
    "الله اكبر",
    "لا اله الا الله",
    "استغفر الله العظيم"
  ];
  double angle = 0;

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Stack(
      children: [
        Scaffold(
          body: Container(
            width: double.infinity,
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Image.asset(
                      "assets/images/head_sebha.png",
                    ),
                    InkWell(
                      onTap: () {
                        tasebeh_var();
                      },
                      child: Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.09),
                          child: Transform.rotate(
                              angle: angle,
                              child:
                              Image.asset("assets/images/body_sebha.png"))),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Text(
                  "عدد التسبيحات",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "$counter",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    tasebeh[index],
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 16),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  int index = 0;

  void tasebeh_var() {
    counter++;
    angle += 20;
    if (counter % 33 == 0) {
      index++;
    }
    if (counter % 165 == 0) {
      index = 0;
    }
    setState(() {});
  }
}
