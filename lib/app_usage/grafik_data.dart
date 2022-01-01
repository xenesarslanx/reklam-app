import 'package:app_usage/app_usage.dart';
import 'package:charts_flutter/flutter.dart' as charts;

//satır grafik
class PopulationData {
 
  String appName;
  int usageMinute;

  PopulationData({
    required this.appName,
    required this.usageMinute,
  });
}

final List<PopulationData> data = [
  //
  // PopulationData(//
  //   appName: 'a',
  //   usageMinute: 200,
  // ),
 
];

getSeriesData(List<AppUsageInfo> information) {
//sort((a,b)=>a.usage.inMinutes.compareTo(b.usage.inMinutes))
  populationDataAdding(information);
//information.forEach((element)=>print(element.packageName));
 
  List<charts.Series<PopulationData, String>> series = [

    charts.Series(
      id: "Time Using",
     data: data,

      domainFn: (PopulationData series, _) {
        return series.appName;},
      measureFn: (PopulationData series, _) => series.usageMinute,

    )
  ];
  return series;
}

 populationDataAdding(List<AppUsageInfo> information) {
   // PopulationData(
   //   appName: 'a',
   //   usageMinute: 200,
   // ),
//
   for (int i=0;i<information.length;i++){
     if(information[i].usage.inMinutes > 10){ //dakikası 10 den fazla olanları grafiğe aktar
    data.add(PopulationData(appName: information[i].packageName.substring(4) + ': ${information[i].usage.inMinutes} dk',
                            usageMinute: information[i].usage.inMinutes ));
    
     }
   }
}

