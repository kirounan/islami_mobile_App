import 'package:flutter/material.dart';
import 'package:p1_islami/my_theme.dart';
import 'home-screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home.routeName,
      routes:{ Home.routeName:(context) => Home()},
      theme: MyThemdata.lightMode,
      darkTheme: MyThemdata.darkMode,
    );
  }
}
