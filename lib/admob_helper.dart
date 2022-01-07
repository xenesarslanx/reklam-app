import 'dart:io';

class AdHelper {

  static String get bannerAdUnitId {//real id:'ca-app-pub-5417429060364094/3906048934'
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw  UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {//real id:"ca-app-pub-5417429060364094/4835987226"
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/1033173712";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/4411468910";
    } else {
      throw  UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {//real id:"ca-app-pub-5417429060364094/1467179703"
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/5224354917";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/1712485313";
    } else {
      throw  UnsupportedError("Unsupported platform");
    }
  }
}