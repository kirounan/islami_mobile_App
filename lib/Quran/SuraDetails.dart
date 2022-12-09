import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:p1_islami/Quran/itemSoraDetails.dart';
import 'package:p1_islami/my_theme.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = 'SuraDetails';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if(verses.isEmpty){
      LoadQuranFile(args.index);
    }
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
            args.name,
            style: Theme.of(context).textTheme.headline1,
          ),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          decoration: BoxDecoration(
              color: MyThemdata.whiteColor,
              borderRadius: BorderRadius.circular(24)),
          child:verses.length==0?
            CircularProgressIndicator(
    color: Theme.of(context).primaryColor,
    ):
    ListView
    .separated(
              itemBuilder: (context, index) => itemSuraDetails(name: verses[index]),
              separatorBuilder: (context, index) {
                return Divider(
                  color: Theme.of(context).primaryColor,
                  thickness: 2,
                );
              },
              itemCount: verses.length),
        ),
      ),
    ]);
  }

  void LoadQuranFile(int index) async {
    String Filecontent =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = Filecontent.split('\n');
    verses = lines;
    setState(() {

    });
  }
}

class SuraDetailsArgs {
  String name;
  int index;
  SuraDetailsArgs({required this.name, required this.index});
}
