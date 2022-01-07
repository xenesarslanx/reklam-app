import 'package:flutter/material.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';
 
class NativeAds extends StatefulWidget {
  const NativeAds({Key? key}) : super(key: key);
 
  @override
  _NativeAdsState createState() => _NativeAdsState();
}
 
class _NativeAdsState extends State<NativeAds>
    with AutomaticKeepAliveClientMixin {
  final controller = NativeAdController();
 
  @override
  void initState() {
    super.initState();
    controller.load(keywords: ['car', 'sport']);
    controller.onEvent.listen((event) {
      setState(() {});
    });
  }
 
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return controller.isLoaded
        ? NativeAd(
            height: 330,
            unitId: MobileAds.nativeAdTestUnitId,
            //real id:'ca-app-pub-5417429060364094/8778175622',
            //test id:'ca-app-pub-3940256099942544/2247696110'
            // unitId: MobileAds.nativeAdTestUnitId,
 
            loading: Text('loading'),
            error: Text('Ads failed to load'),
            icon: AdImageView(size: 80),
            headline: AdTextView(
              padding: EdgeInsets.only(bottom: 10),
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              maxLines: 1,
            ),
            media: AdMediaView(
              height: 180,
              width: MATCH_PARENT,
            ),
            attribution: AdTextView(
              width: WRAP_CONTENT,
              text: 'Ad',
              decoration: AdDecoration(
                  border: BorderSide(color: Colors.green, width: 2),
                  borderRadius: AdBorderRadius.all(16)),
              style: TextStyle(color: Colors.green),
              padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0),
            ),
            button: AdButtonView(
              decoration: AdDecoration(backgroundColor: Colors.blue),
              elevation: 18,
              textStyle: TextStyle(color: Colors.white),
              height: MATCH_PARENT,
            ),
 
            buildLayout: fullBuilder,
          )
        : SizedBox(
            height: 330,
          );
  }
 
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
 
AdLayoutBuilder get fullBuilder => (ratingBar, media, icon, headline,
        advertiser, body, price, store, attribuition, button) {
      return AdLinearLayout(
        decoration: AdDecoration(
          backgroundColor: Colors.black54,
        ),
        padding: EdgeInsets.all(10),
        width: MATCH_PARENT,
 
        children: [
          media,
          AdLinearLayout(
            children: [
              icon,
              AdLinearLayout(children: [
                headline,
                AdLinearLayout(
                  children: [attribuition, advertiser, ratingBar],
                  orientation: HORIZONTAL,
                  width: MATCH_PARENT,
                ),
              ], margin: EdgeInsets.only(left: 4)),
            ],
            gravity: LayoutGravity.center_horizontal,
            width: WRAP_CONTENT,
            orientation: HORIZONTAL,
            margin: EdgeInsets.only(top: 6),
          ),
          AdLinearLayout(
            children: [button],
            orientation: HORIZONTAL,
          ),
        ],
      );
    };