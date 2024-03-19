import 'package:flutter/material.dart';

  final lightTheme = ThemeData(
    primaryColor: Colors.blueAccent,
    backgroundColor: Colors.white,
    colorScheme: ColorScheme.light(primary: Colors.blueAccent)
  );
  final darkTheme = ThemeData(
    backgroundColor: Colors.black,
    colorScheme: ColorScheme.light(primary: Colors.blueAccent),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal
      ),
      displayLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold 
      ),
        displayMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold 
      ),
        displaySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold 
      ),
      
    )
  );