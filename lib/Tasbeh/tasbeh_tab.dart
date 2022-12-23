import 'dart:math';

import 'package:flutter/material.dart';
import 'package:p1_islami/my_theme.dart';
import 'package:p1_islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Tasbehtab extends StatefulWidget {
  @override
  State<Tasbehtab> createState() => _TasbehtabState();
}

class _TasbehtabState extends State<Tasbehtab> with TickerProviderStateMixin{
  List<String> praises = ["الله أكبر", "الحمد لله", "سبحان الله"];
  int index= 2;
  int count = 0;
  double angle = 0.03125,angle2 =0.05;
  late AnimationController controller,controller2;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this
    );
    controller2 = AnimationController(
        duration: const Duration(milliseconds: 1000),
        vsync: this
    );
   // controller.repeat();
    super.initState();
  }
  Curve sinC = SineCurve(count: 0.5);
  late final Animation<double> animation = CurvedAnimation(
    parent: controller2,
    curve: sinC,
  );
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40, top: 10),
                    child: RotationTransition(
                      turns:animation,
                      child: Image.asset("assets/images/head_sebha_logo.png",
                          color: provider.isDarkMode()
                              ? MyThemdata.Gold
                              : Theme.of(context).primaryColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: RotationTransition(
                      turns: Tween(begin: 0.0, end: angle).animate(controller),
                      child: Image.asset("assets/images/body_sebha_logo.png",
                          color: provider.isDarkMode()
                              ? MyThemdata.Gold
                              : Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              flex: 6,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Text(
                      AppLocalizations.of(context)!.praisesNum,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: provider.isDarkMode()
                            ? Color(0x141A2EFF)
                            : Color(0xFFC7B295),
                        borderRadius: BorderRadius.circular(25)),
                    child: Text("$count",style: Theme.of(context).textTheme.subtitle1,),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        count++;
                        if(count >90) {
                          count = 0;
                          index = 2;
                        }
                        else if(count>=60){
                          index = 0;
                        }
                        else if(count>=30){
                          index=1;
                        }
                        if(angle >=1){
                          angle += 0.03125;
                        }
                        controller.forward();
                        angle += 0.03125;
                        controller2.reset();
                        controller2.forward();
                        setState(() {

                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: provider.isDarkMode()
                              ? MyThemdata.Gold
                              : Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          praises[index],
                          style: TextStyle(
                              color: provider.isDarkMode()
                                  ? MyThemdata.blackColor
                                  : MyThemdata.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
class  SineCurve extends Curve{
  final double count;
  SineCurve({this.count = 1});
  @override
  double transformInternal(double t){
 var val = sin(count*2*pi*t)*0.2;
 return val;
  }
}
