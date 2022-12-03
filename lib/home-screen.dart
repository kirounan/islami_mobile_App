import 'package:flutter/material.dart';
import 'package:p1_islami/Sura_Name.dart';
import 'package:p1_islami/my_theme.dart';

class Home extends StatelessWidget {
  static const String routeName = 'home';
  List<String> names = ["الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
    ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
    ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
    ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
    ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
    ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
    ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
    ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
    ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
    "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];
   Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/main_background.png',
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              "إسلامي",
              style: Theme.of(context).textTheme.headline1,
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Center(child: Image.asset("assets/images/quran_image.png")),
              Divider(
                color:MyThemdata.primaryLight,
                thickness: 2,
              ),
              Text("إسم الصورة",style: Theme.of(context).textTheme.subtitle1,),
              Divider(
                color:MyThemdata.primaryLight,
                thickness: 2,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context,index){
                    return Divider(
                      color:MyThemdata.primaryLight,
                      thickness: 2,
                    );
                  },
                  itemBuilder: (context,index){
                  return SuraName(name: names[index]);
                },
                itemCount: names.length,),
              ),

            ],
          ),
        )
      ],
    );
  }
}
