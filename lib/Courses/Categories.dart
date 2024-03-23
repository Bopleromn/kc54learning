import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kc54learning/Courses/%20VideoPage.dart';
import 'package:kc54learning/Courses/CoursesModel.dart';
import 'package:kc54learning/Courses/CategoryModel.dart';
import 'package:kc54learning/Courses/CourseModel.dart';
import 'package:kc54learning/Courses/TeacherTitle.dart';
import 'package:kc54learning/Themes/TextFieldStyles.dart';

import 'VideoModel.dart';

class Categories extends StatefulWidget{
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int _indexCourses = 0, _indexVideos = 0;

  List<CourseModel> courses = [
    //CourseModel(1, 'Figma', 'Это описание для данного курса. Он очень интересный', 'https://www.youtube.com/watch?v=hs2rWKLCvwg', 1, 3,),
    //CourseModel(1, 'Unity', 'Это описание для данного курса. Он очень интересный', 'https://www.youtube.com/watch?v=hs2rWKLCvwg', 1, 1,),
    //CourseModel(1, 'Python', 'Это описание для данного курса. Он очень интересный', 'https://www.youtube.com/watch?v=hs2rWKLCvwg', 1, 2,),
  ];
  
  List<VideoModel> videos = [
    VideoModel('https://www.youtube.com/watch?v=aj-LGRczt7Q&t=1s','assets/fluttervideo.png', 'Dart SDK', 'assets/kvarkvar.png', 'Квеквескири В.А.'),
    VideoModel('https://www.youtube.com/watch?v=cfJrtx-k96U','assets/robloxvideo.png', 'Создание 3D игр', 'assets/aduskin.png', 'Адышкин С.С.'),
    VideoModel('https://www.youtube.com/watch?v=VPvVD8t02U8', 'assets/unityvideo.png', 'Основы Unity', 'assets/chur.png', 'Щур Д.С.'),
  ];

  _CategoriesState(){
    fillList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        toolbarHeight: 100,
        flexibleSpace: Container(
          padding: EdgeInsets.only(left: 25,right: 25,top: 70),
          decoration: shadowBorder(Theme.of(context).shadowColor),
          child: TextField(
            decoration: fieldBorder('Поиск'),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 10),
        child: Column(
          children: [
              Expanded(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Курсы', style: Theme.of(context).textTheme.titleLarge,),
                TextButton(onPressed: (){},child: Text('показать больше', style: Theme.of(context).textTheme.displayMedium,))
              ],
            ), flex: 5,),
            Expanded(child: PageView.builder(
                  itemCount: courses.length,
                  controller: PageController(viewportFraction: 0.8),
                  onPageChanged: (index) => setState(() => _indexCourses = index),
                  itemBuilder: _buildListItemCategories,
            ), flex: 12,),
            Expanded(child: Container(), flex: 2,),
            Expanded(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Видео', style: Theme.of(context).textTheme.titleLarge,),
                TextButton(onPressed: (){},child: Text('показать больше', style: Theme.of(context).textTheme.displayMedium,))
              ],
            ), flex: 3,),
            Expanded(child: PageView.builder(
              itemCount: videos.length,
              controller: PageController(viewportFraction: 0.8),
              onPageChanged: (index) => setState(() => _indexVideos = index),
              itemBuilder: _buildListItemVideos,
            ), flex: 20,),
          ],
        ),
      ),
    );
  }

  Widget _buildListItemCategories(BuildContext context, int index){
   CourseModel course = courses[index];

   return AnimatedPadding(
       duration: const Duration(milliseconds: 400),
       curve: Curves.fastOutSlowIn,
       padding: EdgeInsets.all(_indexCourses == index ? 0.0 : 8.0),
       child: GestureDetector(
         onTap: (){
           Navigator.push(
             context,
             MaterialPageRoute(builder: (context) => TeacherTitle(course)),
           );
         },
         child: SizedBox(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: course.photo!,
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
         ),
       ),
   );
  }

  Widget _buildListItemVideos(BuildContext context, int index) {
    VideoModel video = videos[index];

    return AnimatedPadding(
      duration: const Duration(milliseconds: 400),
      curve: Curves.fastOutSlowIn,
      padding: EdgeInsets.all(_indexVideos == index ? 0.0 : 8.0),
      child: GestureDetector(
        onTap: () {
                     Navigator.push(
             context,
             MaterialPageRoute(builder: (context) => VideoPage(video)),
           );

        },
        child: SizedBox(
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Column(
              children: [
                ClipRRect(borderRadius: BorderRadius.circular(30),child: Image.asset(video.photoVideo,)),
                Padding(padding: EdgeInsets.only(top: 10)),
                Row( 
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10)),
                    CircleAvatar(
                        backgroundImage: AssetImage(video.photoTeacher),
                        radius: 20,
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(video.nameVideo, style: Theme.of(context).textTheme.titleSmall,),                 
                        Text(video.nameTeacher, style: Theme.of(context).textTheme.titleSmall,),                 
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void fillList() async{
    courses = await CoursesModel.getCourses();
    setState(() {
      courses;
    });
  }
}