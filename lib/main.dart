import 'package:flutter/material.dart';
import 'package:p1_islami/Hadeth/HadethDetails.dart';
import'package:p1_islami/Quran/SuraDetails.dart';
import 'package:p1_islami/my_theme.dart';
import 'package:p1_islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home/home-screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main(){

  // print("finish");
  // if (MyApp.share.getLanguage() == true){
  //   print(MyApp.share.getLanguage());
  //   print("if1");
  //   AppConfigProvider.lanF = true;}
  // if (MyApp.share.getTheme() == true) {
  //   AppConfigProvider.ThemF = true;
  //   print("if2");
  // }
  // print("object");
  runApp(ChangeNotifierProvider(
      create: (context)=>AppConfigProvider(),
      child:  MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    init(provider);
    // if(share.getLanguage()==false)
    //   provider.appLanguage='en';
    // else
    //   provider.appLanguage='ar';
    // if(share.getTheme()==false)
    //   provider.appTheme=ThemeMode.light;
    // else
    // //   provider.appTheme=ThemeMode.dark;

    // if(AppConfigProvider.lanF==true) {
    //   print(MyApp.share.getLanguage());
    //   print("main");
    //   provider.appLanguage = 'ar';
    //   AppConfigProvider.lanF=false;
    // }
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
  void init(AppConfigProvider provider)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if ((prefs.getBool("language")??true)==true){
      provider.appLanguage='en';
      print((prefs.getBool("language")));}
    else
      {
        provider.appLanguage='ar';
    print((prefs.getBool("language")));

      }
    print((prefs.getBool("language")));
    if((prefs.getBool("theme")??true)==true)
      provider.appTheme=ThemeMode.light;
    else
      provider.appTheme=ThemeMode.dark;
  }
}
