import 'package:flutter/material.dart';

class MyThemdata {
  static Color primaryLight = Color(0xFFB7935F),
      blackColor = Color(0xFF242424),
      whiteColor = Color(0xFFFFFFFF),
      primaryBlack = Color(0xFF141A2E);
  static ThemeData lightMode = ThemeData(
      primaryColor: primaryLight,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: blackColor,
        unselectedItemColor: whiteColor,
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: blackColor,
        ),
        subtitle1: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: blackColor,
        ),
        subtitle2: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: blackColor,
        ),
      ),
      iconTheme: IconThemeData(color: blackColor));
  static ThemeData darkMode = ThemeData();
}
