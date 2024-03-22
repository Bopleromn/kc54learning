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
        physics: NeverScrollableScrollPhysics(),
        controller: _pagecontroller,
        children: [
          Categories(),
          Scaffold(),
          Scaffold(),
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
        Icon(Icons.chat),
        Icon(Icons.man),
        Icon(Icons.storage),
        Icon(Icons.support_agent)
      ],
      ),
    );
  }
  void _openPage(int index){
    setState(() => _currentIndex = index);
    _pagecontroller.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.linear);
  }
}