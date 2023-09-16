import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static Color primaryColor = Color(0XFFB7935F);
  static Color blackColor = Color(0XFF242424);
  static ThemeData lightMode = ThemeData(
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: primaryColor,
        size: 30
      ),
      color: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
      bodySmall: GoogleFonts.elMessiri(
          fontSize: 20, fontWeight: FontWeight.w400, color: blackColor),
      bodyMedium: GoogleFonts.elMessiri(
          fontSize: 25, fontWeight: FontWeight.w700, color: Color(0xffFFFFFF)),
      bodyLarge: GoogleFonts.elMessiri(
          fontSize: 30, fontWeight: FontWeight.bold, color: blackColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: blackColor,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.shifting
    )
  );
}
