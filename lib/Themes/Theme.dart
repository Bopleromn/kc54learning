import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

  final lightTheme = ThemeData(
    primaryColor: Colors.blueAccent,
  );
  final darkTheme = ThemeData(
    primaryColor: Colors.black,
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
      
    )
  );