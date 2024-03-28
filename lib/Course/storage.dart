import 'package:flutter/Cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kc54learning/Course/course_model.dart';
import 'package:kc54learning/Course/courses_model.dart';
import 'package:kc54learning/Themes/styles.dart';

class Storage extends StatefulWidget {
  const Storage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _StorageState();
  }
}

class _StorageState extends State<Storage> {
  List<CourseModel> courses = [];
  
  _StorageState(){
    fillList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
        
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30
        ),
        automaticallyImplyLeading: false,
        leading: null,
        backgroundColor: Theme.of(context).primaryColor,
        toolbarHeight: 100,
        flexibleSpace: Container(
          padding: EdgeInsets.only(left: 20,right: 20,top: 50),
          decoration: shadowBorder(Theme.of(context).shadowColor),
          child: Column(
            children: [
              Expanded(child: Text('Поиск', style: Theme.of(context).textTheme.headlineMedium,),flex: 20,),
              Expanded(child: TextField(
            obscureText: false,
            decoration: fieldBorder('Поиск',),
          ),flex: 40,),
          Expanded(child: Container(),flex: 10,)
            ],
          )
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10,right: 10,top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Container(),flex: 3,),
            Expanded(child: Text('Курсы', style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center,),flex: 7,),
            Expanded(child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.5
              ),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle
                    ),
                    child: Image.asset('assets/python.png'),
                  ),
                );
              },
            ),flex: 47,),
            Expanded(child: Container(),flex: 5,),
            Expanded(child: Container(decoration: BoxDecoration(
              color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    color: Colors.grey.withOpacity(0.2)
                  ),
                  
                ]
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Container(),flex: 5,),
                Expanded(child: Image.asset('assets/Home.png', scale: 1.7,),flex: 20,),
                Expanded(child: Container(),flex: 5,),
                Expanded(child: Text('Гайды', style: Theme.of(context).textTheme.titleLarge,),flex: 25,),
                Expanded(child: Container(),flex: 55,)

              ],
            ),
            ),flex: 12,),
            Expanded(child: Container(),flex: 5,
            ),
            Expanded(child: Container(
              decoration: BoxDecoration(
              color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 6,
                    color: Colors.grey.withOpacity(0.4)
                  ),
                ]
            ),
            child: Row(
              children: [              Expanded(child: Container(),flex: 5,),
                Expanded(child: Image.asset('assets/Loly.png', scale: 1.7,),flex: 20,),
                Expanded(child: Container(),flex: 5,),
                Expanded(child: Text('Вебинары', style: Theme.of(context).textTheme.titleLarge,),flex: 45,),
                Expanded(child: Container(),flex: 35,)],
            ),
            ),flex: 12,),
            Expanded(child: Container(),flex: 5,),
            Expanded(child: Container(
              decoration: BoxDecoration(
              color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 6,
                    color: Colors.grey.withOpacity(0.4)
                  ),
                ]
            ),
            child: Row(
              children: [
                              Expanded(child: Container(),flex: 5,),
                Expanded(child: Image.asset('assets/Teachers.png', scale: 1.7,),flex: 20,),
                Expanded(child: Container(),flex: 5,),
                Expanded(child: Text('Преподаватели', style: Theme.of(context).textTheme.titleLarge,),flex: 60,),
                Expanded(child: Container(),flex: 15,)
              ],
            ),
            ),flex: 12,),
            Expanded(child: Container(),flex: 5,)
          ],
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