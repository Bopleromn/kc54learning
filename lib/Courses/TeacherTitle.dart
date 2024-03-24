import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kc54learning/Courses/CourseModel.dart';
import 'package:kc54learning/Courses/Test.dart';
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
          Expanded(child: Row(
            children: [
              Expanded(child: CircleAvatar(
                backgroundImage: course!.teacher!.photo,
                radius: 100
              ), flex: 25,),
              Expanded(child: Container(),flex: 5,),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
<<<<<<< HEAD
                  Expanded(child: Container(),flex: 10,),
                  Expanded(flex: 30,child: Text(course!.teacher!.name!, style: Theme.of(context).textTheme.titleMedium,)),
                  Expanded(child: Text(course!.teacher!.email!, style: Theme.of(context).textTheme.labelMedium,),flex: 15,),
=======
                  Expanded(child: Container(),flex: 20,),
                  Expanded(flex: 20,child: Text(course!.teacher!.name, style: Theme.of(context).textTheme.titleMedium,)),
                  Expanded(child: Text(course!.teacher!.email, style: Theme.of(context).textTheme.labelMedium,),flex: 15,),
>>>>>>> 0712ac4 (huuihihuhu)
                  Expanded(child: Container(),flex: 20,)
                ],
              ),flex: 70,),
            ],
<<<<<<< HEAD
          ),flex: 20,),
          Expanded(child: Container(), flex: 3,),
=======
          ),flex: 18,),
>>>>>>> 0712ac4 (huuihihuhu)
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
<<<<<<< HEAD
            ),flex: 40,),
          Expanded(child: Container(),flex: 1,),
=======
            ),flex: 35,),
          Expanded(child: Container(),flex: 2,),
>>>>>>> 0712ac4 (huuihihuhu)
          Expanded(child: Text(
            course!.desc,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          flex: 23),
          Expanded(child: Container(
          ), flex: 5,),
          Expanded(child: ElevatedButton(onPressed: (){
<<<<<<< HEAD
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Test(course!)),
            );
          }, child: Text('Перейти к Тесту', style: Theme.of(context).textTheme.headlineMedium,), style: mainButton(Theme.of(context).primaryColor),),flex: 8,),
=======
          
          }, child: TextButton(onPressed: (){
                                 Navigator.push(
             context,
             MaterialPageRoute(builder: (context) => Test()),
           );
          },child: Text('Перейти к Тесту', style: Theme.of(context).textTheme.headlineMedium,)), style: mainButton(Theme.of(context).primaryColor),),flex: 8,),
>>>>>>> 0712ac4 (huuihihuhu)
          Expanded(child: Container(),flex: 8,)
          ],
        ),
      ),
    );
  }
}