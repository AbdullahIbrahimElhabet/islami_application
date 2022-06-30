import 'package:flutter/material.dart';
import 'package:islami_refresh/provider/language_provider.dart';
import 'package:islami_refresh/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheet();
}

class _LanguageBottomSheet extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var langProvider = Provider.of<LanguageProvider>(context);

    return Container(
      child: Column(
        children: [
          InkWell(
              onTap: () {
                langProvider.changeLanguage("en");

                Navigator.pop(context);
              },
              child: languageSelected(
                  "English", langProvider.baseLanguage == "en")),
          InkWell(
            onTap: () {
              langProvider.changeLanguage("ar");

              Navigator.pop(context);
            },
            child:
                languageSelected("العربية", langProvider.baseLanguage == "ar"),
          )
        ],
      ),
    );
  }

  Widget languageSelected(String title, bool isSelcetd) {
    if (isSelcetd) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: Theme.of(context).colorScheme.surface, fontSize: 16),
            ),
            Icon(
              Icons.check,
              color: Theme.of(context).colorScheme.surface,
              size: 30,
            )
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:
                Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
