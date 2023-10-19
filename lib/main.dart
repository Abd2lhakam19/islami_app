import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_app/ahadeth_details.dart';
import 'package:islami_app/home_screen.dart';
import 'package:islami_app/myThemeData.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/splash_screen.dart';
import 'package:islami_app/sura_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MyProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(pro.languuageCode),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routName,
      routes: {
        HomeScreen.routName: (context) => HomeScreen(),
        SplashScreen.routName:(context)=>SplashScreen(),
        SuraDetails.routName: (context) => SuraDetails(),
        AhadethDetails.routName: (context) => AhadethDetails(),
      },
      theme: MyThemeData.lightMode,
    );
  }
}
