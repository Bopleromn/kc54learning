import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<dynamic> initImage(int id) async {
  return NetworkImage('http://83.147.245.57/get_img?id=$id');
}

void showSnackBar(context, String message){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.grey,
    ),
  );
}
