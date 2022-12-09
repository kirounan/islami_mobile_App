import 'package:flutter/material.dart';
import 'package:p1_islami/Hadeth/hadeth_tab.dart';
import 'package:p1_islami/Quran/quran_tab.dart';
import 'package:p1_islami/home/radio_tab.dart';
import 'package:p1_islami/home/tasbeh_tab.dart';

class Home extends StatefulWidget {
  static const String routeName = 'home';

  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/main_background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              "إسلامي",
              style: Theme.of(context).textTheme.headline1,
            ),
            centerTitle: true,
          ),
          body: tabs[selectedIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index){
                selectedIndex = index;
                setState(() {

                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_quran.png'),
                    ),
                    label: 'قرآن'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_hadeth.png'),
                    ),
                    label: 'حديث'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_sebha.png'),
                    ),
                    label: 'تسبيح'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_radio.png'),
                    ),
                    label: 'راديو'),
              ],
            ),
          ),
        )
      ],
    );
  }

  List<Widget> tabs = [
    Qurantab(),Hadethtab(),Tasbehtab(),Radiotab(),
  ];
}
