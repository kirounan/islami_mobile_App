import 'package:flutter/material.dart';
import 'package:p1_islami/my_theme.dart';
import 'package:p1_islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Radiotab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      child: Column(
        children: [
          Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Image.asset("assets/images/radio_image.png"),
              )),
          Expanded(
              flex: 6,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Text(
                      AppLocalizations.of(context)!.quranRadio,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: (){

                        },
                        child: Icon(Icons.arrow_back_ios,
                            size: 50, color: provider.isDarkMode()?
                            MyThemdata.Gold: Theme.of(context).primaryColor),
                      ),
                      InkWell(
                        onTap: (){

                        },
                        child: Icon(Icons.play_arrow_sharp,
                            size: 50, color: provider.isDarkMode()?
                            MyThemdata.Gold: Theme.of(context).primaryColor),
                      ),
                      InkWell(
                        onTap: (){

                        },
                        child: Icon(Icons.arrow_forward_ios_sharp,
                            size: 50, color:provider.isDarkMode()?
                                MyThemdata.Gold: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
