import 'package:flutter/Cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kc54learning/Themes/styles.dart';

class ManyCategories extends StatelessWidget {
  const ManyCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30
        ),
        automaticallyImplyLeading: true,
        leading: null,
        backgroundColor: Theme.of(context).primaryColor,
        toolbarHeight: 100,
        flexibleSpace: Container(
          padding: EdgeInsets.only(left: 40,right: 40,top: 45),
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
            ),flex: 87,)
          ],
        ),
      ),
    );
  }
}