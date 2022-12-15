import 'package:flutter/material.dart';
import 'package:p1_islami/Hadeth/HadethDetails.dart';
import'package:p1_islami/Quran/SuraDetails.dart';
import 'package:p1_islami/my_theme.dart';
import 'package:p1_islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'home/home-screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context)=>AppConfigProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
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
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
      themeMode: provider.appTheme,
    );
  }
}
