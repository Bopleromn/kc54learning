import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kc54learning/Courses/CategoriesModel.dart';
import 'package:kc54learning/Courses/CategoryModel.dart';
import 'package:kc54learning/Courses/CourseModel.dart';
import 'package:kc54learning/Courses/Courses.dart';
import 'package:kc54learning/Themes/TextFieldStyles.dart';

import 'VideoModel.dart';

class Categories extends StatefulWidget{
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int _index = 0;

  List<CategoryModel> categories = [
    CategoryModel(id: 1, title: 'Figma', photo: 'assets/figma.png'),
    CategoryModel(id: 1, title: 'Unity', photo: 'assets/unity.png'),
    CategoryModel(id: 1, title: 'Python', photo: 'assets/python.png'),
  ];
  
  List<VideoModel> videos = [
    VideoModel('assets/fluttervideo.png', 'Dart SDK',  'Квеквескири В.А.', 'assets/kvarkvar.png'),
    VideoModel('assets/robloxvideo.png', 'Создание 3D игр', 'Адышкин С.С.', 'assets/aduskin.png'),
    VideoModel('assets/unityvideo.png', 'Основы Unity', 'Щур Д.С.', 'assets/chur.png'),
  ];

  _CategoriesState(){
    //fillList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        toolbarHeight: 100,
        flexibleSpace: Container(
          padding: EdgeInsets.all(25),
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
            Expanded(child: Container(), flex: 3,),
            Expanded(child: PageView.builder(
                  itemCount: categories.length,
                  controller: PageController(viewportFraction: 0.8),
                  onPageChanged: (index) => setState(() => _index = index),
                  itemBuilder: _buildListItemCategories,
            ), flex: 12,),
            Expanded(child: Container(), flex: 2,),
            Expanded(child: Text('Видео', style: Theme.of(context).textTheme.titleLarge,), flex: 3,),
            Expanded(child: PageView.builder(
              itemCount: videos.length,
              controller: PageController(viewportFraction: 0.8),
              onPageChanged: (index) => setState(() => _index = index),
              itemBuilder: _buildListItemVideos,
            ), flex: 10,),
            Expanded(child: Container(), flex: 10,),
          ],
        ),
      ),
    );
  }

  Widget _buildListItemCategories(BuildContext context, int index){
   CategoryModel category = categories[index];

   return AnimatedPadding(
       duration: const Duration(milliseconds: 400),
       curve: Curves.fastOutSlowIn,
       padding: EdgeInsets.all(_index == index ? 0.0 : 8.0),
       child: GestureDetector(
         onTap: (){
           Navigator.push(
             context,
             MaterialPageRoute(builder: (context) => Courses(category)),
           );
         },
         child: SizedBox(
           width: 150,
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(category.photo,),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(category.title, style: Theme.of(context).textTheme.headlineLarge,)],
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
      padding: EdgeInsets.all(_index == index ? 0.0 : 8.0),
      child: GestureDetector(
        onTap: () {

        },
        child: SizedBox(
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.all(5),
                    child: Image.asset(video.photoVideo,)),
                Text(video.nameVideo, style: Theme.of(context).textTheme.headlineLarge,),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void fillList() async{
    categories = await CategoriesModel.getCategories();
    setState(() {
      categories;
    });
  }
}