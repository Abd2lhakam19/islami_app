import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/myThemeData.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';

import 'language_bottom_sheet.dart';

class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${AppLocalizations.of(context)!.theme}',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: provider.isDarkMode()
                          ? MyThemeData.whiteColor
                          : MyThemeData.blackColor),
                ),
                IconButton(
                  onPressed: () {
                    provider.changeTheme(ThemeMode.dark);
                  },
                  icon: provider.isDarkMode()
                      ? Icon(
                    Icons.dark_mode,
                    color: MyThemeData.whiteColor,
                  )
                      : Icon(
                    Icons.light_mode,
                    color: MyThemeData.blackColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.language,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: provider.isDarkMode()
                          ? MyThemeData.whiteColor
                          : MyThemeData.blackColor),
                ),
                InkWell(
                  onTap: () {
                    showLanguageBottomSheet(context);
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Text(
                          provider.isEnglish()
                              ? AppLocalizations.of(context)!.english
                              : AppLocalizations.of(context)!.arabic,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                              color: provider.isDarkMode()
                                  ? MyThemeData.whiteColor
                                  : MyThemeData.blackColor),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: provider.isDarkMode()
                              ? MyThemeData.whiteColor
                              : MyThemeData.blackColor,
                          size: 25,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet(context) {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottomSheet());
  }
}