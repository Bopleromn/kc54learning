import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:kc54learning/Courses/CategoryModel.dart';

import '../main.dart';
import 'CourseModel.dart';

class CoursesModel{
  static Future<List<CourseModel>> getCourses() async{
    final response = await Dio().get(
      'http://$ip/courses_get'
    );

    Map<String, dynamic> json = response.data as Map<String, dynamic>;

    if(!json['success']){
      return [];
    }

    List<dynamic> lst = json['data'];
    List<CourseModel> courses = [];

    for (var item in lst) {
      courses.add(CourseModel(item['Id'], item['Title'], item['Description'], item['VideoUrl'], item['IdImg'], item['IdTeacher'], item['IdTest']));
    }

    return courses;
  }
}