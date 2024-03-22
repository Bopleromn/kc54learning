import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kc54learning/Courses/CourseModel.dart';
import 'package:kc54learning/Themes/TextFieldStyles.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TeacherTitle extends StatefulWidget {

  @override
  State<TeacherTitle> createState() => _TeacherTitleState(course);

  CourseModel? course;

  TeacherTitle(CourseModel course){
    this.course = course;
  }
}

class _TeacherTitleState extends State<TeacherTitle> {
  late YoutubePlayerController _youtubePlayerController;
  CourseModel? course;

  _TeacherTitleState(CourseModel? course){
    this.course = course;
  }

  @override
  void initState() {
    super.initState();
    final VideoID = YoutubePlayer.convertUrlToId(course!.videoUrl);

    _youtubePlayerController = YoutubePlayerController(initialVideoId: VideoID!,
    flags: YoutubePlayerFlags(
      autoPlay: false,
    )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(course!.title, style: Theme.of(context).textTheme.titleMedium,textAlign: TextAlign.center,),
        iconTheme: IconThemeData(
          color: Colors.blueAccent
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Expanded(child: Row(
            children: [
              Expanded(child: CircleAvatar(
                backgroundImage: NetworkImage(course!.photo),
                radius: 100
              ), flex: 25,),
              Expanded(child: Container(),flex: 5,),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Container(),flex: 10,),
                  Expanded(flex: 30,child: Text(course!.teacher!.name, style: Theme.of(context).textTheme.titleMedium,)),
                  Expanded(child: Text(course!.teacher!.email, style: Theme.of(context).textTheme.labelMedium,),flex: 15,),
                  Expanded(child: Container(),flex: 20,)
                ],
              ),flex: 70,),
            ],
          ),flex: 20,),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),

              ),
              child: YoutubePlayer(
                controller: _youtubePlayerController,
                onReady: (){
                },
              ),
            ),flex: 40,),
          Expanded(child: Container(),flex: 2,),
          Expanded(child: Text(
            course!.desc,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          flex: 23),
          Expanded(child: Container(
          ), flex: 5,),
          Expanded(child: ElevatedButton(onPressed: (){}, child: Text('Перейти к Тесту', style: Theme.of(context).textTheme.headlineMedium,), style: mainButton(Theme.of(context).primaryColor),),flex: 8,),
          Expanded(child: Container(),flex: 8,)
          ],
        ),
      ),
    );
  }
}