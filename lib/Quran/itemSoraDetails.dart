import 'package:flutter/material.dart';
import 'package:p1_islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class itemSuraDetails extends StatelessWidget {
  String name;
  itemSuraDetails({required this.name});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(

      child:provider.isDarkMode()?
      Text(
        name,
        style: Theme.of(context).textTheme.subtitle1,
        textAlign: TextAlign.center,
      ):Text(
        name,
        style: Theme.of(context).textTheme.subtitle2,
        textAlign: TextAlign.center,
      )
      ,
    );
  }
}
