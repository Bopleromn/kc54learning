import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kc54learning/Courses/CategoryModel.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class Categories extends StatefulWidget{
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<CategoryModel> categories = [
    CategoryModel(id: 1, title: 'Dart', photo: 'assets/python.png'),
    CategoryModel(id: 1, title: 'Dart', photo: 'assets/python.png'),
    CategoryModel(id: 1, title: 'Dart', photo: 'assets/python.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container(), flex: 3,),
          Expanded(child: Text('Выбери подходящий курс', style: Theme.of(context).textTheme.titleLarge,), flex: 5,),
          Expanded(child: ScrollSnapList(
            itemBuilder: _buildListItem,
            itemCount: categories.length,
            itemSize: double.parse(categories.length.toString()),
            onItemFocus: (index){},
            initialIndex: 1,
            dynamicItemSize: true,
          ), flex: 15,),
          Expanded(child: Container(), flex: 13,),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index){
   CategoryModel category = categories[index];

   return SizedBox(
     width: 250,
     child: Card(
       child: Column(
           children: [
             Padding(padding: EdgeInsets.all(30), child:
                Image.asset(category.photo, fit: BoxFit.fitHeight,),
             ),
             Text(category.title, style: Theme.of(context).textTheme.titleMedium,),
           ],
         ),
     ),
   );
  }
}