import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_refresh/hadeeth/hadeth_detials.dart';
import 'package:islami_refresh/home_screen.dart';
import 'package:islami_refresh/my_theme.dart';
import 'package:islami_refresh/provider/language_provider.dart';
import 'package:islami_refresh/provider/theme_provider.dart';
import 'package:islami_refresh/quran/sura_details.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (BuildContext) {
      return LanguageProvider();
    },
    child: ChangeNotifierProvider(
        create: (BuildContext) {
          return ThemeProvider();
        },
        child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  late ThemeProvider themeProvider;
  late LanguageProvider langProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);
    langProvider = Provider.of<LanguageProvider>(context);
    sharedPrefre();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Islami App",
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale(langProvider.baseLanguage),
      routes: {
        HomeScreen.screenName: (context) => HomeScreen(),
        SuraDetails.screenName: (context) => SuraDetails(),
        HadethDetails.screenName: (context) => HadethDetails(),
      },
      initialRoute: HomeScreen.screenName,
      theme: MyTheme.ligthTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: themeProvider.themeMode,
    );
  }

  void sharedPrefre() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    langProvider.changeLanguage(prefs.getString("lang") ?? "en");
    if (prefs.getString("theme") == "ligth") {
      themeProvider.changeTheme(ThemeMode.light);
    } else if (prefs.getString("theme") == "dark") {
      themeProvider.changeTheme(ThemeMode.dark);
    }
  }
}
