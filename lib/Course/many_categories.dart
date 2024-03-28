import 'package:flutter/Cupertino.dart';
import 'package:flutter/material.dart';

class ManyCategories extends StatelessWidget {
  const ManyCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Все курсы', style: Theme.of(context).textTheme.titleLarge,),
        centerTitle: true,
      ),
    );
  }
}