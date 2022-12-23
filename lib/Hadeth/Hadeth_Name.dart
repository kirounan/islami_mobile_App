import 'package:flutter/material.dart';
import 'package:p1_islami/Hadeth/HadethDetails.dart';
import 'hadeth_tab.dart';
class hadethName extends StatelessWidget {
  Hadeth hadeth;
  hadethName({required this.hadeth});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(HadethDetails.routeName,
          arguments: hadeth );
        },
        child: Text(
          hadeth.title,
          style: Theme.of(context).textTheme.subtitle2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
