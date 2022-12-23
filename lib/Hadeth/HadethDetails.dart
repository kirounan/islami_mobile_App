import 'package:flutter/material.dart';
import 'package:p1_islami/Hadeth/itemhadethDetails.dart';
import 'package:p1_islami/my_theme.dart';
import 'package:p1_islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import 'hadeth_tab.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = 'HadethDetails';

  @override
  State<HadethDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute
        .of(context)
        ?.settings
        .arguments as Hadeth;
    return Stack(children: [
      provider.isDarkMode()?
      Image.asset(
        'assets/images/dark_bg.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ):Image.asset(
        'assets/images/main_background.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      )
      ,
      Scaffold(
        appBar: AppBar(
          title: Text(
            args.title,
            style: Theme
                .of(context)
                .textTheme
                .headline1,
          ),
          centerTitle: true,
        ),
        body:
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          decoration: BoxDecoration(

              color:provider.isDarkMode()?
              MyThemdata.primaryDark:
              MyThemdata.whiteColor,
              borderRadius: BorderRadius.circular(24)),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return itemHadethDetails(name:args.contentHadeth[index]);
            },
            itemCount: args.contentHadeth.length,),

        )
      ),
    ]);
  }
}

