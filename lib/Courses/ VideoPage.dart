import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kc54learning/Courses/VideoModel.dart';
import 'package:kc54learning/Themes/TextFieldStyles.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {

  @override
  State<VideoPage> createState() => _VideoPageState(video);

  VideoModel? video;

  VideoPage(VideoModel video){
    this.video = video;
  }
}
class _VideoPageState extends State<VideoPage> {
  late YoutubePlayerController _youtubePlayerController;
  final VideoURL = "https://www.youtube.com/watch?v=YPRaA6KhyXc&list=PL0lO_mIqDDFWqpFH_ZxzfgDqsK9LHNxRY";
  late VideoModel? video;

  _VideoPageState(VideoModel? video){
    this.video = video;
  }
  @override
  void initState() {
    super.initState();
    final VideoID = YoutubePlayer.convertUrlToId(video!.videoUrl);

    _youtubePlayerController = YoutubePlayerController(initialVideoId: VideoID!,
    flags: YoutubePlayerFlags(
      autoPlay: true,
    )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(0.2),
        title: Text(video!.nameVideo),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10,right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: Container(),flex: 2,),
            Expanded(flex: 35,child: YoutubePlayer(controller: _youtubePlayerController, onReady: (){},)),
            Expanded(child: Container(),flex: 3,),
            Expanded(child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: CircleAvatar(
                    backgroundImage: AssetImage(video!.photoTeacher),
                    radius: 30,
                  ), flex: 20,),
                  Expanded(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Container(),flex: 10,),
                      Expanded(child: Text(video!.nameVideo, style: Theme.of(context).textTheme.titleLarge,),flex: 20,),
                      Expanded(child: Container(),flex: 5,),
                      Expanded(child: Text(video!.nameTeacher),flex: 20,),
                      Expanded(child: Container(),flex: 10,)

                    ],
                  ),flex: 60,),
                  Expanded(child: Container(),flex: 20,)
                ],
              
              ),
            ), flex: 15,),
            Expanded(child: Container(),flex: 3,),
            Expanded(flex: 45,child: Container(
              padding: EdgeInsets.only(left: 5,right: 5,top: 10),
              decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15)
            ),child: Text('Описание...............................................................................................................................................................................................................................................', style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.start,)),),
            Expanded(child: Container(), flex: 3,),
            Expanded(child: TextButton(onPressed: (){},child: Text('Поддержать автора', style: Theme.of(context).textTheme.headlineMedium,), style: mainButton(Colors.blueAccent),),flex: 10,),
            Expanded(child: Container(),flex: 5,)

          ],
        ),
      ),
    );
  }
}