import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kc54learning/Courses/CategoryModel.dart';
import 'package:kc54learning/Themes/TextFieldStyles.dart';

import 'CourseModel.dart';

class Courses extends StatefulWidget{
  CategoryModel? category;

  Courses(CategoryModel category){
    this.category = category;
  }

  @override
  State<Courses> createState() => _CoursesState(category);
}

class _CoursesState extends State<Courses> {
  int _index = 0;

  CategoryModel? category;
  List<CourseModel> courses = [
    CourseModel(id: 1, title: 'Python', desc: 'desc', videoUrl: '', photoPath: 'assets/python.png'),
    CourseModel(id: 1, title: 'Python', desc: 'desc', videoUrl: '', photoPath: 'assets/python.png'),
    CourseModel(id: 1, title: 'Python', desc: 'desc', videoUrl: '', photoPath: 'assets/python.png'),
    CourseModel(id: 1, title: 'Python', desc: 'desc', videoUrl: '', photoPath: 'assets/python.png'),
    CourseModel(id: 1, title: 'Python', desc: 'desc', videoUrl: '', photoPath: 'assets/python.png'),
  ];

  _CoursesState(CategoryModel? category){
    this.category = category;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Expanded(
              child: Text('Каталог курсов по тематике ${category!.title}'),
              flex: 5,
            ),
            Expanded(
                child: TextField(
                  decoration: fieldBorder('Поиск'),
                ),
                flex: 3,
            ),
            Expanded(child: Container(), flex: 0,),
            Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: _buildListItem,
                ),
                flex: 20,
            ),
            Expanded(child: Container(), flex: 3,),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index){
    CourseModel course = courses[index];

    return AnimatedPadding(
      duration: const Duration(milliseconds: 400),
      curve: Curves.fastOutSlowIn,
      padding: EdgeInsets.all(_index == index ? 0.0 : 8.0),
      child: GestureDetector(
        onTap: (){

        },
        child: SizedBox(
          width: 150,
          child: Card(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(30), child:
                Image.asset(course.photoPath, fit: BoxFit.cover, width: 150,),
                ),
                Text(course.title, style: Theme.of(context).textTheme.titleMedium,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}