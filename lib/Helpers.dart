import 'package:flutter/cupertino.dart';

Future<dynamic> initImage(int id) async {
  return NetworkImage('http://83.147.245.57/get_img?id=$id');
}