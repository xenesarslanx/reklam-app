import 'package:flutter/widgets.dart';
import 'app_usage/grafik.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_usage/app_usage.dart';
//bu sınıfta kendını dinleyenlere haber verme ozellıgı kazandırıorz (ChangeNotifier)
class PuanData with ChangeNotifier{
GrafikState gr = GrafikState();
late final List<AppUsageInfo> information;
late List<AppUsageInfo> infoList;
List<AppUsageInfo> infos = [];

late SharedPreferences _sharedPrefObject;

void deneme(){
if(gr.largest[0]<60){
  puan=puan+0.000;
}
}

double puan=0.000;
double get sayacitem=> puan;

void setvalue(double value){
  puan=value;

}
  void kamuspotupuan() {//bildirim.toplamsure.toDouble())/(information.length.toDouble())>15000.toDouble()
 // print(infoList.length.toDouble());
  print(bildirim.toplamsure);    
  double x=((bildirim.toplamsure)/10) ;
  double y=90.0;
     if(x>y){//vakit harcanan uygulamaların ortalama kullanım süresi 90dk dan büyükse
      puan=puan-(puan/2);
    } else {
      puan=puan+0.001;   
}
    savePuanToSharedPref(puan);

    notifyListeners();
  }

   void odullureklampuan() {
  double x=((bildirim.toplamsure)/10) ;
  double y=90.0;
  //+gr.largest[1]+gr.largest[2]+gr.largest[3]+gr.largest[4]
     if(x>y){
      puan=puan-(puan/2);
    } else {
      puan=puan+0.002;
    }
    savePuanToSharedPref(puan);

    notifyListeners();
  }

  Future<void> createSharedPrefObject() async{
    _sharedPrefObject = await SharedPreferences.getInstance();
  }
  
  void savePuanToSharedPref(double value){
    _sharedPrefObject.setDouble('puan', value );
  }
  
  void loadPuanFromsharedPref() async{
   await createSharedPrefObject();
    puan = _sharedPrefObject.getDouble('puan')!;
  }

}
