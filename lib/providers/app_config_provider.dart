import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AppConfigProvider extends ChangeNotifier{
   String appLanguage = 'en';
   ThemeMode appTheme = ThemeMode.light;
  static bool lanF= false,ThemF = false;
  void ChangeLanguage(String newLanguage)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("start0");
    if(appLanguage==newLanguage){
      return;
    }
    appLanguage = newLanguage;
    print("start");
    if(newLanguage=='ar') {

      prefs.setBool("language", false);
      print(prefs.getBool("language"));
      print("if");
    }
    else{
      prefs.setBool("language", true);
      print(prefs.getBool("language"));
      print("else");
    }
    print(prefs.getBool("language"));
    print("end");
    notifyListeners();


    }
  void ChangeTheme(ThemeMode newTheme)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(appTheme==newTheme){
      return;
    }
    appTheme = newTheme;
    notifyListeners();
    if(newTheme==ThemeMode.dark)
      prefs.setBool("theme", false);
    else{
      prefs.setBool("theme", true);
    }
  }
  bool isDarkMode(){
    return appTheme == ThemeMode.dark;
  }
  }
