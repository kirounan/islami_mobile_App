import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:p1_islami/my_theme.dart';
import 'package:p1_islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class themeBottomSheet extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    //SharedPreffernces share = SharedPreffernces();
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: (){
              provider.ChangeTheme(ThemeMode.light);

            },
            child:  provider.appTheme==ThemeMode.light?
            getSelectedItem(context, AppLocalizations.of(context)!.light,provider):
            getUnSelectedItem(context, AppLocalizations.of(context)!.light)
          ),
          SizedBox(height: 7,),
          Container(height: 1,color: MyThemdata.blackColor,),
          SizedBox(height: 7,),
          InkWell(
            onTap: (){
              provider.ChangeTheme(ThemeMode.dark);
            },
            child: provider.appTheme==ThemeMode.dark?
                getSelectedItem(context, AppLocalizations.of(context)!.dark,provider):
                getUnSelectedItem(context, AppLocalizations.of(context)!.dark)
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
