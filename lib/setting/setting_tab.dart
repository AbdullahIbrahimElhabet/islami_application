import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_refresh/provider/language_provider.dart';
import 'package:islami_refresh/provider/theme_provider.dart';
import 'package:islami_refresh/setting/language_bottom_sheet.dart';
import 'package:islami_refresh/setting/theme_bootom_sheet.dart';
import 'package:provider/provider.dart';

class SettingTab extends StatefulWidget {
  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var langProvider = Provider.of<LanguageProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(AppLocalizations.of(context)!.theme),
        ),
        InkWell(
          onTap: () {
            showThemeBottomSheet();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Theme.of(context).colorScheme.surface),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Text(themeProvider.themeMode == ThemeMode.light
                        ? AppLocalizations.of(context)!.ligth
                        : AppLocalizations.of(context)!.dark),
                  ],
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(AppLocalizations.of(context)!.language),
        ),
        InkWell(
          onTap: () {
            showLanguageBottomSheet();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Theme.of(context).colorScheme.surface),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Text(langProvider.baseLanguage == "en"
                        ? "English"
                        : "العربيه"),
                  ],
                )),
          ),
        )
      ],
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (bulidContext) {
          return ThemBottomSheet();
        });
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (bulidContext) {
          return LanguageBottomSheet();
        });
  }
}
