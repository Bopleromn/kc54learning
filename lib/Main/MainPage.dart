import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kc54learning/Courses/Categories.dart';

class MainPage extends StatefulWidget{
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final _pagecontroller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pagecontroller,
        children: [
          Scaffold(),
          Scaffold(),
          Categories(),
          Scaffold()
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        onTap: _openPage,
        color: Color(0xffF1F5FF),
        backgroundColor: Color(0xffF1F5FF).withOpacity(0.4),
        items: [
        Icon(Icons.home),
        Icon(Icons.book_online),
        Icon(Icons.man),
        Icon(Icons.settings)
      ],
      ),
    );
  }
  void _openPage(int index){
    setState(() => _currentIndex = index);
    _pagecontroller.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.linear);
  }
}