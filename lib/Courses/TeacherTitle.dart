import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kc54learning/Courses/CourseModel.dart';
import 'package:kc54learning/Courses/Test.dart';
import 'package:kc54learning/Main/MainPage.dart';
import 'package:kc54learning/Themes/TextFieldStyles.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'Test.dart';

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
        elevation: 6,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20)
          )
        ),
        surfaceTintColor: Colors.white,
        shadowColor: Colors.grey.withOpacity(0.5),
        centerTitle: false,
        title: Text(course!.title, style: Theme.of(context).textTheme.titleLarge,textAlign: TextAlign.center,),
        iconTheme: IconThemeData(
          color: Colors.blueAccent
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Expanded(flex: 18,child: Row(
            children: [
              Expanded(child: CircleAvatar(
                backgroundImage: course!.teacher!.photo,
                radius: 100
              ), flex: 25,),
              Expanded(child: Container(),flex: 5,),
              Expanded(flex: 70,child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Container(),flex: 20,),
                  Expanded(flex: 20,child: Text(course!.teacher!.name!, style: Theme.of(context).textTheme.titleMedium,)),
                  Expanded(flex: 15,child: Text(course!.teacher!.email!, style: Theme.of(context).textTheme.labelMedium,),),
                  Expanded(child: Container(),flex: 20,)
                ],
              ),),
            ],
          ),),
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
            ),flex: 35,),
          Expanded(child: Container(),flex: 2,),
          Expanded(child: Text(
            course!.desc,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          flex: 23),
          Expanded(child: Container(
          ), flex: 5,),
          Expanded(child: ElevatedButton(onPressed: (){
          
          }, child: TextButton(onPressed: (){
                                 Navigator.push(
             context,
             MaterialPageRoute(builder: (context) => MainPage()),
           );
          },child: Text('Перейти к Тесту', style: Theme.of(context).textTheme.headlineMedium,)), style: mainButton(Theme.of(context).primaryColor),),flex: 8,),
          Expanded(child: Container(),flex: 8,)
          ],
        ),
      ),
    );
  }
}