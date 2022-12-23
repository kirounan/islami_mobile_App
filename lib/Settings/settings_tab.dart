import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:p1_islami/Settings/language_bottom_sheet.dart';
import 'package:p1_islami/Settings/theme_bottom_sheet.dart';
import 'package:p1_islami/my_theme.dart';
import 'package:p1_islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
class SettingsTab extends StatefulWidget {

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,
          style: Theme.of(context).textTheme.headline1,),
          SizedBox(height: 18,),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).primaryColor
            ),
            child: InkWell(
              onTap: (){
                showLanguageBottomSheet();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.appLanguage=='en'?
                    AppLocalizations.of(context)!.english:
                  AppLocalizations.of(context)!.arabic,
                  style: Theme.of(context).textTheme.headline3,),
                  Icon(Icons.arrow_drop_down_outlined,size: 35,color: MyThemdata.whiteColor,)
                ],
              ),
            ),
          ),
          SizedBox(height: 18,),
          Text(AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.headline1,),
          SizedBox(height: 18,),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).primaryColor
            ),
            child: InkWell(
              onTap: (){
                showThemeBottomSheet();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.appTheme==ThemeMode.dark?
                  AppLocalizations.of(context)!.dark:
                  AppLocalizations.of(context)!.light,
                    style: Theme.of(context).textTheme.headline3,),
                  Icon(Icons.arrow_drop_down_outlined,size: 35,color: MyThemdata.whiteColor,)
                ],
              ),
            ),
          )

        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(context: context, builder: (context)=>languageBottomSheet());
  }
  void showThemeBottomSheet() {
    showModalBottomSheet(context: context, builder: (context)=>themeBottomSheet());
  }
}
