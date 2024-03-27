import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BoxDecoration shadowBorder(Color color){
  return BoxDecoration(
      boxShadow: [
        BoxShadow(
          blurRadius: 7,
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          offset: Offset(0, 2)
      )
    ]
  );
}

InputDecoration fieldBorder(String hint){
  return InputDecoration(
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10.0),
    ),
    fillColor: Colors.white,
    filled: true,
    hintText: hint,
  );
}

ButtonStyle mainButton(Color color){
  return ElevatedButton.styleFrom(
    elevation: 8,
    shadowColor: Colors.grey.withOpacity(0.5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    backgroundColor: color,
  );
}