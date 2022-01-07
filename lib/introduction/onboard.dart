import 'package:flutter/material.dart';

class OnboardingItem{
  final String title;
  final String subtitle;
  final String image;
  final Color color;
 
const OnboardingItem({
  required this.title, required this.subtitle, required this.image, required this.color
});
}

class OnboardingItems{
  static List<OnboardingItem> loadOnboardingItem(){
    const fi = <OnboardingItem>[
      OnboardingItem(
        title: 'Reklam İzle',
        subtitle:"Reklamları İzleyerek Ve Cihazınızı Daha Az Kullanarak Puan Toplayabilirsiniz \n --------------------------------------------------------------------->",
        image:"lib/assets/Googlearka.png",
        color:Colors.green
      ),
      OnboardingItem(
        title: 'Puan Bağışı',
        subtitle:"Puanlarınızın Gerçek Değeri Kadar Adınıza Belli Kurumlara Bağış Yapabiliriz. \n"
         "--------------------------------------------------------------------->",
        
        image:"lib/assets/Googlearka.png",
        color:Colors.red
      ),
    ];
    return fi;
  }
}