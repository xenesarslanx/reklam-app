import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../native_ads.dart';

class Kamuspotu extends StatefulWidget {
  const Kamuspotu({ Key? key }) : super(key: key);

  @override
  _KamuspotuState createState() => _KamuspotuState();
}

class _KamuspotuState extends State<Kamuspotu> {

  @override
  void initState(){
    super.initState();
  }
 static String videoID1 = 'cfGdN1xLOeY'; // YouTube Video Full URL : https://www.youtube.com/watch?v=cfGdN1xLOeY
 static String videoID2 = 'eejicPTXc2E';
 static String videoID3 = '4SUUHwK52gI';
 static String videoID4 = 'H221icrX3NM';
 static String videoID5 = 'hKSWCMG6epE';

 YoutubePlayerController _controller1 = YoutubePlayerController(
    initialVideoId: videoID1,
    flags: YoutubePlayerFlags(
    autoPlay: false,
    mute: false,
    ),
  );
YoutubePlayerController _controller2 = YoutubePlayerController(initialVideoId: videoID2, flags: YoutubePlayerFlags(autoPlay: false,mute: false,),);
YoutubePlayerController _controller3 = YoutubePlayerController(initialVideoId: videoID3, flags: YoutubePlayerFlags(autoPlay: false,mute: false,),);
YoutubePlayerController _controller4 = YoutubePlayerController(initialVideoId: videoID4, flags: YoutubePlayerFlags(autoPlay: false,mute: false,),);
YoutubePlayerController _controller5 = YoutubePlayerController(initialVideoId: videoID5, flags: YoutubePlayerFlags(autoPlay: false,mute: false,),);

 
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         centerTitle: true,
       backgroundColor: Colors.greenAccent[200],
       elevation: 0.4,
          title: Text('Kamu Spotu Reklamları'),
        ),
        body: SingleChildScrollView(
         padding:EdgeInsets.all(15),
         physics: BouncingScrollPhysics(),

        child:Column(
         children: <Widget>[
            YoutubePlayer(//video1
              controller: _controller1,
              liveUIColor: Colors.amber,
              showVideoProgressIndicator: true, //ilerleme çubuğu
              ),
              
              SizedBox(
                height:50,
              ),
              NativeAds(),//yerel gelişmiş reklam
              YoutubePlayer(controller: _controller2,liveUIColor: Colors.amber,showVideoProgressIndicator: true,),//video2
              NativeAds(),//yerel gelişmiş reklam

               SizedBox(
                height:50,
              ),
              NativeAds(),//yerel gelişmiş reklam
            
              YoutubePlayer(controller: _controller3,liveUIColor: Colors.amber,showVideoProgressIndicator: true,),//video3
               SizedBox(
                height:50,
              ),
              NativeAds(),//yerel gelişmiş reklam

              YoutubePlayer(controller: _controller4,liveUIColor: Colors.amber,showVideoProgressIndicator: true,),//video4
              NativeAds(),//yerel gelişmiş reklam

               SizedBox(
                height:50,
              ),
              YoutubePlayer(controller: _controller5,liveUIColor: Colors.amber,showVideoProgressIndicator: true,),//video5
              NativeAds(),//yerel gelişmiş reklam
        
       
          ],
          ),
                      ),
    );
  }
}