import 'package:flutter/material.dart';
import 'package:p1_islami/Hadeth/itemhadethDetails.dart';
import 'package:p1_islami/my_theme.dart';

import 'hadeth_tab.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = 'HadethDetails';

  @override
  State<HadethDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute
        .of(context)
        ?.settings
        .arguments as Hadeth;
    return Stack(children: [
      Image.asset(
        'assets/images/main_background.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
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
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          decoration: BoxDecoration(
              color: MyThemdata.whiteColor,
              borderRadius: BorderRadius.circular(24)),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return itemHadethDetails(name:args.contentHadeth[index]);
            },
            itemCount: args.contentHadeth.length,),

        ),
      ),
    ]);
  }
}

