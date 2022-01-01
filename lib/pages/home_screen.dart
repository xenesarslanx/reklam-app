
import 'package:app_usage/app_usage.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:reklam/app_usage/grafik.dart';
import 'package:reklam/pages/kamu_spotu.dart';
import 'package:reklam/pages/odullu_reklam.dart';
import 'package:reklam/puan_data.dart';

import '../admob_helper.dart';
import '../login/methods.dart';
import 'kamu_spotu.dart';

 class HomeScreen extends StatefulWidget {

  State<HomeScreen> createState() => HomeScreenState();
}
class HomeScreenState extends State<HomeScreen> {
  double deger=0.000;
 
    Future<void> refresh() async {
    DateTime endDate =  DateTime.now();
    DateTime startDate = endDate.subtract(Duration(days: 1));
    List<AppUsageInfo> infoList =
        await AppUsage.getAppUsage(startDate, endDate);
    infos = infoList;
    setState(() {});
  }
  
  List<AppUsageInfo> infos = [];
 
  late InterstitialAd _interstitialAd;
  late RewardedAd _rewardedAd;
  bool _isInterstitialAdReady = false;
  bool _isRewardedAdReady = false;

  BannerAd? bannerAd;
  bool isLoaded=false;

  @override
  void initState() {//geçiş reklamı
    super.initState();
    deger=Provider.of<PuanData>(context, listen: false).sayacitem; //provider

      InterstitialAd.load(
       adUnitId: AdHelper.interstitialAdUnitId,
        request: const AdRequest(),
         adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad){
           this._interstitialAd = ad;
           _isInterstitialAdReady = true;
         },
          onAdFailedToLoad:(error){
          print('failed geçiş reklamı');
          }
         ));
         

       RewardedAd.load(
       adUnitId: AdHelper.rewardedAdUnitId,
        request: const AdRequest(),
         rewardedAdLoadCallback: RewardedAdLoadCallback(onAdLoaded: (ad){
           this._rewardedAd = ad;
           _isRewardedAdReady = true;
         },
          onAdFailedToLoad:(error){
          
          }
         ));
  }
@override
  void dispose() {
    super.dispose();
    _interstitialAd.dispose();
    _rewardedAd.dispose();
  }


 @override
  didChangeDependencies(){
  super.didChangeDependencies();
  bannerAd=BannerAd(
    size: AdSize.banner,//ca-app-pub-5417429060364094/3906048934
   adUnitId:AdHelper.bannerAdUnitId,
    listener: BannerAdListener(
      onAdLoaded: (ad){
        setState(() {
          isLoaded=true;
        });
        print("banner added");
      
      },
      onAdFailedToLoad: (ad,error){
        ad.dispose();
        print("hataa");
      }
    ),
     request: AdRequest(),
     );
     bannerAd!.load();
}

   @override
   Widget build(BuildContext context){
   return 
   Consumer<PuanData>(
     builder:(context, mypuan, child){
   
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: SafeArea(
       child: Scaffold(
         backgroundColor: Colors.green[300],
       appBar: AppBar(
         title: Text('Ana Sayfa'),
       centerTitle: true,
       backgroundColor: Colors.red[800],
       elevation: 0.4,
       ),
   
       body: Column(
         
         children:[
           SizedBox(width: 20, height: 20,),
             Padding(
               padding: const EdgeInsets.all(10.0),
       child: ElevatedButton(
                style: ElevatedButton.styleFrom(
               primary: Colors.deepOrange[400],
               fixedSize: const Size(240, 60),            
           ),
                 onPressed: () {
                    Navigator.push(
                       context,
                        MaterialPageRoute(
                          builder: (context) => Kamuspotu(),
                        )
                        );
                      setState(() {
                        var mypuan = context.read<PuanData>();
                           mypuan.kamuspotupuan(); 
                        _interstitialAd.show();
                      });
       
   
                  }, 
                 child: const Text('Kamu Spotu')),
             ),
       SizedBox(width: 20, height: 20,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                 primary: Colors.redAccent[500],
                 fixedSize: const Size(240, 60),            
           ),
                  onPressed:  () {
                    Navigator.push(
                       context,
                        MaterialPageRoute(
                          builder: (context) => odullu_reklam(),
                        )
                        );
                      setState(() {
                      
                        _interstitialAd.show();
                      });
       
   
                  }, 
                 child: const Text('Ödüllü Reklamlar')),
              ),
               
                    SizedBox(width: 20, height: 20,),
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                   primary: Colors.yellow[500],
                   fixedSize: const Size(240, 60),            
           ),
                    child: Text('Cihaz Kullanım İstatistiği'),
                   onPressed: () {
                    Navigator.push(
                       context,
                        MaterialPageRoute(
                          builder: (context) => Grafik(information: infos)
                        )
                        );
                      setState(() {
                        refresh();
                        _interstitialAd.show();
                      });
                  },             
                    ),
               ),
                    SizedBox(width: 20, height: 20,),

               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                   primary: Colors.green[800],
                   fixedSize: const Size(240, 60),            
           ),
                    child: Text('Puanlarınızla Bağış Yapın!\n           (Çok Yakında)'),
                   onPressed: null
                         
                    ),
               ),
                    SizedBox(width: 20, height: 20,),
                  ElevatedButton(
                    onPressed: null,
                   
                     child: Text('Puan:'+mypuan.puan.toString(),),
                     ),
                    
     Padding(
       padding: const EdgeInsets.only(top: 70, right: 20, bottom: 10, left: 20),
       child:
        TextButton(
             onPressed: () => logOut(context),
             child:Text('Çıkış yap'),
             style: TextButton.styleFrom(
               primary: Colors.red,
               onSurface: Colors.black,
               side: const BorderSide(color: Colors.grey, width: 2),
             ),),
     ),
   
    const Spacer(),//banner reklam gösterme
    isLoaded
    ?  SizedBox(
     height: 50,
     child:AdWidget(ad: bannerAd!,),
    ):const SizedBox(),
           ],
          ),
         ),
        ),
       );   
      },
     );
    }
   }
   