import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:kc54learning/Courses/CategoryModel.dart';

class CategoriesModel{
  static Future<List<CategoryModel>> getCategories() async{
    final response = await Dio().get(
      'http://83.147.245.57/get_all_categories'
    );

    Map<String, dynamic> json = response.data as Map<String, dynamic>;

    List<dynamic> lst = json['response'];
    List<CategoryModel> categories = [];

    for (var item in lst) {
      categories.add(CategoryModel(id: item['Id'], title: item['Name'], photo: item['PhotoPath']));
    }

    return categories;
  }
}