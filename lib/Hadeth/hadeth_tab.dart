import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Hadeth_Name.dart';

class Hadethtab extends StatefulWidget {
  @override
  State<Hadethtab> createState() => _HadethtabState();
}

class _HadethtabState extends State<Hadethtab> {
  List<Hadeth> allHadeth = [];

  @override
  Widget build(BuildContext context) {
    if(allHadeth.isEmpty){
      loadHadithFile();
    }
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child:
              Image.asset("assets/images/hadeth_logo.png"),
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            thickness: 2,
          ),
          Text(
            "إسم الحديث",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            thickness: 2,
          ),
          Expanded(
            flex: 5,
            child:
              allHadeth.length==0?
          Center(child: CircularProgressIndicator(color:Theme.of(context).primaryColor),):
            ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  color: Theme.of(context).primaryColor,
                  thickness: 2,
                );
              },
              itemBuilder: (context, index) {
                return hadethName(hadeth: allHadeth[index]);
              },
              itemCount: allHadeth.length,
            ),
          )
        ],
      ),
    );
  }

  void loadHadithFile() async {
    String Allcontent = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> allHadethList = Allcontent.split("#\r\n");
    for (int i = 0; i < allHadethList.length; i++) {
      List<String> Ahadethlines = allHadethList[i].split('\n');
      String title = Ahadethlines[0];
      Ahadethlines.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, contentHadeth: Ahadethlines);
      allHadeth.add(hadeth);
    }
    setState(() {});
  }
}

class Hadeth {
  String title;
  List<String> contentHadeth;
  Hadeth({required this.title, required this.contentHadeth});
}
