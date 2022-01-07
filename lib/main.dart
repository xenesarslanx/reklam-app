import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';
import 'package:reklam/pages/home_screen.dart';
import 'package:reklam/puan_data.dart';
import 'introduction/custom.dart';
import 'introduction/onboard.dart';
import 'login/autheticate.dart';
import 'package:provider/provider.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.initialize();
  await Firebase.initializeApp();
  MobileAds.setTestDeviceIds(['9345804C1E5765DHG1DFE29CA0758842']);//
  final AppOpenAd appOpenAd = AppOpenAd();
  if (!appOpenAd.isAvailable) {
    await appOpenAd.load(unitId: MobileAds.appOpenAdTestUnitId);//'ca-app-pub-5417429060364094/5523569708'
  }
  if (appOpenAd.isAvailable) {
    await appOpenAd.show();
  }
  runApp(
    ChangeNotifierProvider(
      create: (context) =>PuanData(),
  child:MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AnimatedSplashScreen(
        backgroundColor: Colors.yellow,
        splash: Image.asset('lib/assets/logoEApp2.png'),
        nextScreen: MyApp(),
        splashIconSize: 400,
        splashTransition: SplashTransition.scaleTransition,
      ),
    ),
  )
  );
}
 
class introduction extends StatelessWidget {
  const introduction({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {

  Provider.of<PuanData>(context, listen: false).loadPuanFromsharedPref();



    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
        headline5: TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white60),
        bodyText1: TextStyle(fontSize: 14, color: Colors.white),
        bodyText2: TextStyle(fontSize: 20, color: Colors.white),
        
      )),
      home: Scaffold(
          body: SafeArea(
        child: PageView.builder(
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              OnboardingItem oi = OnboardingItems.loadOnboardingItem()[index];
              return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: oi.color,
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: [
                          ElevatedButton(
                            child: Text('GEÇ',
                                style: Theme.of(context).textTheme.headline5),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: Text('Az Bak Kazan Uygulaması'),
                          ),
                                          
                        ],
                      ),
                      HeroImage(
                        img: oi.image,
                        imgHeight: MediaQuery.of(context).size.height * 0.4,
                      ),
                      Column(
                        children: [
                          Text(
                            oi.title,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(oi.subtitle,
                              style: Theme.of(context).textTheme.bodyText1),
                          SizedBox(height: 40),
                       //   index == (2 - 1)
                       //       ? //2 sayfa sayısıdır
                         //     CustomButton(
                         //         btnText: 'BAŞLA-->',
                        //        )
                        //      : Container()
                        ],
                      ),
                     
                    ],
                  ));
            }),
      )),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Authenticate(),
    );
  }
}
 
