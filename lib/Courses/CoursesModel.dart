import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:kc54learning/Courses/CategoryModel.dart';

import 'CourseModel.dart';

class CoursesModel{
  static Future<List<CourseModel>> getCourses() async{
    final response = await Dio().get(
      'http://83.147.245.57/get_all_categories'
    );

    Map<String, dynamic> json = response.data as Map<String, dynamic>;

    List<dynamic> lst = json['response'];
    List<CourseModel> courses = [];

    for (var item in lst) {
      courses.add(CourseModel(item['Id'], item['Name'], item['Description'], item['VideoURL'], item['PhotoPath'], item['idTeacher'], ));
    }

    return courses;
  }
}