import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:p1_islami/my_theme.dart';
import 'package:p1_islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class languageBottomSheet extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: (){
              provider.ChangeLanguage('ar');
            },
            child:  provider.appLanguage=='ar'?
            getSelectedItem(context, AppLocalizations.of(context)!.arabic,provider):
            getUnSelectedItem(context, AppLocalizations.of(context)!.arabic)
          ),
          SizedBox(height: 7,),
          Container(height: 1,color: MyThemdata.blackColor,),
          SizedBox(height: 7,),
          InkWell(
            onTap: (){
              provider.ChangeLanguage('en');
            },
            child: provider.appLanguage=='en'?
                getSelectedItem(context, AppLocalizations.of(context)!.english,provider):
                getUnSelectedItem(context, AppLocalizations.of(context)!.english)
          ),
          SizedBox(height: 7,),
          Container(height: 1,color: MyThemdata.blackColor,),

        ],
      )
    );
  }
 Widget getSelectedItem (BuildContext context,String text,AppConfigProvider provider){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
          style: Theme.of(context).textTheme.headline4,),
        provider.isDarkMode()?
        Icon(Icons.check,size: 30,color: MyThemdata.Gold,):
        Icon(Icons.check,size: 30,color: Theme.of(context).primaryColor,)
      ],
    );
 }
  Widget getUnSelectedItem (BuildContext context,String text){
    return Row(
      children: [
        Text(text,
          style: Theme.of(context).textTheme.headline2,)
      ],
    );
  }
}
