import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/myThemeData.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/tabs/ahadethTab.dart';
import 'package:islami_app/tabs/quranTab.dart';
import 'package:islami_app/tabs/radioTab.dart';
import 'package:islami_app/tabs/sebhaTab.dart';
import 'package:islami_app/tabs/settingsTab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Stack(children: [
      provider.isDarkMode()
          ? Image.asset(
        'assets/images/dark_bg.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      )
          : Image.asset(
        'assets/images/background.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            '${AppLocalizations.of(context)!.app_title}',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: provider.isDarkMode()?MyThemeData.whiteColor:MyThemeData.blackColor
            ),
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Theme.of(context).primaryColor,
          ),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/quran.png'),
                  ),
                  label: '${AppLocalizations.of(context)!.quran}'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/ahadeth.png'),
                  ),
                  label: '${AppLocalizations.of(context)!.hadeth}'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/sebha.png'),
                  ),
                  label: '${AppLocalizations.of(context)!.sebha}'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/radio.png'),
                  ),
                  label: '${AppLocalizations.of(context)!.radio}'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: '${AppLocalizations.of(context)!.settings}'),
            ],
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            currentIndex: selectedIndex,
          ),
        ),
        body: screens[selectedIndex],
      ),
    ]);
  }

  List<Widget> screens = [
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab(),
  ];
}