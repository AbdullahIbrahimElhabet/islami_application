import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_refresh/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemBottomSheet extends StatefulWidget {
  @override
  State<ThemBottomSheet> createState() => _ThemBottomSheetState();
}

class _ThemBottomSheetState extends State<ThemBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      child: Column(
        children: [
          InkWell(
              onTap: () {
                themeProvider.changeTheme(ThemeMode.light);
                Navigator.pop(context);
              },
              child: themeSelected(AppLocalizations.of(context)!.ligth,
                  themeProvider.themeMode == ThemeMode.light)),
          InkWell(
              onTap: () {
                themeProvider.changeTheme(ThemeMode.dark);
                Navigator.pop(context);
              },
              child: themeSelected(AppLocalizations.of(context)!.dark,
                  themeProvider.themeMode == ThemeMode.dark)),
        ],
      ),
    );
  }

  Widget themeSelected(String title, bool isSelcetd) {
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
