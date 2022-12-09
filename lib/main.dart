import 'package:flutter/material.dart';
import 'package:p1_islami/Hadeth/HadethDetails.dart';
import'package:p1_islami/Quran/SuraDetails.dart';
import 'package:p1_islami/my_theme.dart';
import 'home/home-screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home.routeName,
      routes: {
        Home.routeName: (context) => Home(),
        SuraDetails.routeName: (context) => SuraDetails(),
        HadethDetails.routeName:(context)=>HadethDetails(),
      },
      theme: MyThemdata.lightMode,
      darkTheme: MyThemdata.darkMode,
    );
  }
}
