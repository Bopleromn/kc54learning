import 'package:flutter/material.dart';
import 'package:kc54learning/MainMenu/TextFormWidget.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key});

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(child: Container(), flex: 50,),
            Expanded(child: Container(
              child: Column(
                children: [
                  Expanded(child: Container(),flex: 43,),
                  Expanded(child: Container(
                    color: Colors.grey.withOpacity(0.2),
                    child: TextFieldWidget(),
                  ), flex: 7,)
                ],
              ),
            ), flex: 45,),
            BottomNavigationBar(
              selectedFontSize: 20,
              iconSize: 25,
              selectedItemColor: Colors.blueAccent,
              selectedLabelStyle: textTheme.displayMedium,
              unselectedItemColor: Theme.of(context).bottomAppBarColor,
              unselectedLabelStyle: textTheme.titleMedium,
              showUnselectedLabels: true,
              items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.man),
                label: 'Profile'
                ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings'
                )
            ])
          ],
        ),
      ),
    );
  }
}

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField());
  }
}