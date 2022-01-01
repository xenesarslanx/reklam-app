import 'dart:io';

class AdHelper {

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-5417429060364094/3906048934';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw  UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-5417429060364094/4835987226";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/4411468910";
    } else {
      throw  UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-5417429060364094/1467179703";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/1712485313";
    } else {
      throw  UnsupportedError("Unsupported platform");
    }
  }
}