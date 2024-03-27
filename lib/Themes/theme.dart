import 'package:flutter/material.dart';

  final lightTheme = ThemeData(
    primaryColor: Colors.blue,
    shadowColor: Colors.grey.withOpacity(0.5),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(primary: Colors.blueAccent),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white
      ),
      headlineSmall: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.normal
      ),
      titleSmall: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      displayLarge: TextStyle(
        color: Colors.blueAccent,
        fontSize: 28,
        fontWeight: FontWeight.bold 
      ),
        displayMedium: TextStyle(
        color: Colors.blueAccent,
        fontSize: 20,
        fontWeight: FontWeight.w600 
      ),
        displaySmall: TextStyle(
        color: Colors.blueAccent,
        fontSize: 14,
        fontWeight: FontWeight.bold 
      ),
            labelMedium: TextStyle(
        color: Colors.grey,
        fontSize: 20,
        fontWeight: FontWeight.w400
      ),
        
      
    )
  );
  final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    shadowColor: Colors.grey.withOpacity(0.5),
    colorScheme: ColorScheme.light(primary: Colors.blueAccent),
    useMaterial3: true,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.normal
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.normal
      ),
      displayLarge: TextStyle(
        color: Colors.blueAccent,
        fontSize: 28,
        fontWeight: FontWeight.bold 
      ),
        displayMedium: TextStyle(
        color: Colors.blueAccent,
        fontSize: 20,
        fontWeight: FontWeight.w600 
      ),
        displaySmall: TextStyle(
        color: Colors.blueAccent,
        fontSize: 14,
        fontWeight: FontWeight.bold 
      ),
        labelMedium: TextStyle(
        color: Colors.grey,
        fontSize: 20,
        fontWeight: FontWeight.bold
      ),
            headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white
      ),
        
      
    )
  );