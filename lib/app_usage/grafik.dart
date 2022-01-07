import 'package:app_usage/app_usage.dart';
import 'package:flutter/material.dart';
import 'package:reklam/app_usage/grafik_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:reklam/pages/home_screen.dart';
class Grafik extends StatefulWidget {
  late final List<AppUsageInfo> information;
  GrafikState gr = GrafikState();

  Grafik({required this.information});

  @override
  GrafikState createState() => GrafikState();
}
  

class GrafikState extends State<Grafik> {
  late final List<AppUsageInfo> information;

  List<AppUsageInfo> infos = [];
  late List<AppUsageInfo> infoList;

  var largest = [0];
  var toplam = [0];
  var largests = ['0'];
  var large = [];


  getUsageStats() async {
    
    //bildirim.dene=information.length;
    try {
      DateTime endDate = new DateTime.now();
      DateTime startDate = endDate.subtract(Duration(days: 1));
      infoList = await AppUsage.getAppUsage(startDate, endDate);

      setState(() {
        infos = infoList;
      });

//son 24 saatte 60 dakikadan fazla kullanılan app bulma
      int t;
      for (t = 0; t < infoList.length; t++) {
        if (infos[t].usage.inMinutes > 60) {
          print('${infoList[t].packageName.substring(4)}');
          large.add('${infoList[t].packageName.substring(4)}');
        }
      }
      print(bildirim.de = 'son 24 saatte 60 dakikadan fazla kullandınız');
      // print('son 24 saatte 60 dakikadan fazla kullandınız ${bildirim.uyari=large}');
      bildirim.uyari = large;

//son 24 saatte en çok vakit harcanan app bulma
      int n = 0;
      for (n = 0; n < infoList.length; n++) {
        if (infoList[n].usage.inMinutes.toInt() > largest[0].toInt()) {
          largest[0] = infoList[n].usage.inMinutes.toInt();
          largests[0] = infoList[n].packageName.toString();
        }
      }

      print(bildirim.enCok =
          'son 24 saatte en çok vakit harcanan uygulama:\n ${largests[0].substring(4)}-> kullanım süresi: ${largest[0]} dk');
//Toplam Cihaz Kullanım Süresi Bulma
           for (n = 0; n < infoList.length; n++) {
       toplam[0] = toplam[0]+(infoList[n].usage.inMinutes.toInt());           
           }

        print(bildirim.toplamsure =  toplam[0] );
        toplam[0] = 0;
    } on AppUsageException catch (exception) {
      print(exception);
    }
   
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
           centerTitle: true,
       backgroundColor: Colors.blue[200],
       elevation: 0.4,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
                Navigator.push(
                   context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    )
                    );
                  
              },
          ),
          title: Text('Uygulama Kullanım Süreleri'),
          actions: [
           
          ],
        ),
        body: Column(children: [
          Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                 primary: Colors.blue[400],
                          
           ),
                    child: Text('Bilgi!'),
                    onPressed: () {
                      setState(() {
                        getUsageStats();
                      });
                    }),
              ),
              Container(
                width:250, height: 80,
                color: Colors.green,
                child: Text(bildirim.enCok),                
              ),
             
              Padding(
                padding: const EdgeInsets.only(left: 73),
                child: Container(
                  width:250, height: 30,
                  color: Colors.red[300], 
                  child: Text('Ortalama cihaz kullanımı: ${bildirim.toplamsure} dk'),                
        
                ),
              )
            ],
          ),
          Expanded(
            child: charts.BarChart(
              getSeriesData(widget.information),
        
              animate: true,
              vertical: false, //grafik dikey veya yatay
              domainAxis: const charts.OrdinalAxisSpec(
             //     renderSpec: charts.SmallTickRendererSpec(labelRotation: 0)
                  ),
            ),
          ),
        ]),
      ),
    );
  }
}

class Bildirim {
  List<int>largest;
  List<int>toplam;
  List<dynamic> uyari;
  String enCok;
  int toplamsure;
  int dene;
  String de;
  Bildirim({required this.enCok, required this.uyari, required this.de, required this.dene, required this.largest, required this.toplamsure, required this.toplam});
}

Bildirim bildirim = Bildirim(de: '', enCok: '', uyari: [], largest: [], toplamsure: 0, dene: 0, toplam: []);
