import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kc54learning/Courses/CategoriesModel.dart';
import 'package:kc54learning/Courses/CategoryModel.dart';
import 'package:kc54learning/Courses/CourseModel.dart';
import 'package:kc54learning/Courses/Courses.dart';

class Categories extends StatefulWidget{
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int _index = 0;

  List<CategoryModel> categories = [];

  _CategoriesState(){
    fillList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Expanded(child: Container(), flex: 3,),
            Expanded(child: Text('Выбери подходящий курс', style: Theme.of(context).textTheme.titleLarge,), flex: 5,),
            Expanded(child: PageView.builder(
                  itemCount: categories.length,
                  controller: PageController(viewportFraction: 0.8),
                  onPageChanged: (index) => setState(() => _index = index),
                  itemBuilder: _buildListItem,
            ), flex: 15,),
            Expanded(child: Container(), flex: 5,),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index){
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
           child: Card(
            child: Column(
             children: [
               Padding(padding: EdgeInsets.all(30), child:
                  Image.network(category.photo, fit: BoxFit.fitHeight,),
               ),
               Text(category.title, style: Theme.of(context).textTheme.titleMedium,),
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