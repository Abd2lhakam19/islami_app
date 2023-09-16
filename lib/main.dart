import 'package:flutter/material.dart';
import 'package:islami_app/ahadeth_details.dart';
import 'package:islami_app/home_screen.dart';
import 'package:islami_app/myThemeData.dart';
import 'package:islami_app/sura_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routName,
      routes: {
        HomeScreen.routName: (context) => HomeScreen(),
        SuraDetails.routName: (context) => SuraDetails(),
        AhadethDetails.routName: (context) => AhadethDetails(),
      },
      theme: MyThemeData.lightMode,
    );
  }
}
