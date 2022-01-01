import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:reklam/admob_helper.dart';
import 'package:reklam/puan_data.dart';
import '../admob_helper.dart';

class odullu_reklam extends StatefulWidget {
  const odullu_reklam({ Key? key }) : super(key: key);

  @override
  _odullu_reklamState createState() => _odullu_reklamState();
}

class _odullu_reklamState extends State<odullu_reklam> {
  double deger=0.000;

   late RewardedAd _rewardedAd;
   bool _isRewardedAdReady = false;

   late InterstitialAd _interstitialAd;
  bool _isInterstitialAdReady = false;
  @override
  void initState() {
    deger=Provider.of<PuanData>(context, listen: false).sayacitem; //provider

    super.initState();
     InterstitialAd.load(                         //geçiş reklamı
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
         
       RewardedAd.load(                        //ödüllü reklam
       adUnitId: AdHelper.rewardedAdUnitId,
        request: const AdRequest(),
         rewardedAdLoadCallback: RewardedAdLoadCallback(onAdLoaded: (ad){
           this._rewardedAd = ad;
           _isRewardedAdReady = true;
         },
          onAdFailedToLoad:(error){
          print('failed geçiş reklamı');
          }
         ));
  }
  
@override
  void dispose() {//geçiş reklamı
    super.dispose();
    _interstitialAd.dispose();
    _rewardedAd.dispose();
  }  
@override
  Widget build(BuildContext context) {
    return  Consumer<PuanData>(
      builder:(context, mypuan, child){

      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Ödüllü Reklam'),
            centerTitle: true,
       backgroundColor: Colors.red[800],
       elevation: 0.4,
          ),
          body:SingleChildScrollView(
          child: Center(
            child: Column(
            
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Diğer ödüllü reklamları izlemek için belli bir süre beklemeniz veya uygulamayı yeniden başlatmanız gerekebilir.',
                  style: TextStyle(
      color: Colors.grey[800],
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.italic,
      fontFamily: 'Open Sans',
      fontSize: 20,
      backgroundColor: Colors.red[100]),
),
                ),
                   odulluReklam(context),
                   odulluReklam(context),
                   odulluReklam(context),
                   odulluReklam(context),
                   odulluReklam(context),
                   odulluReklam(context),
                   odulluReklam(context),
                   odulluReklam(context),
                   odulluReklam(context),
                   odulluReklam(context),
                   odulluReklam(context),
                   odulluReklam(context),
                   odulluReklam(context),
                   
              ],
            ),
          ),
      
        ),
        )
      );
      }
    );
  }
Padding odulluReklam(BuildContext context) {
  return Padding(
         padding: const EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 25),
         child: ElevatedButton(
           style: ElevatedButton.styleFrom(
             primary: Colors.deepOrange[600],
             fixedSize: const Size(240, 60),            
           ),
                onPressed:  (){    
           setState(() {
                    _rewardedAd.show(onUserEarnedReward: (RewardedAd ad, RewardItem reward) {  });
             var mypuan = context.read<PuanData>();
                 mypuan.odullureklampuan(); 
               });
            Provider.of<PuanData>(context, listen: false).setvalue(deger);

                },
               child: Text('Ödüllü Reklam İzle')),
       );
}
}

 