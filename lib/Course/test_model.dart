import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../main.dart';

class TestModel{
  int? id;
  String? task;
  String? startCode;
  String? expectedResult;
  String? stdin;

  String? codeToShow;

  TestModel(this.id){
    initFields();
  }

  Future<void> initFields() async{
    await init();
    editStartCode();
  }

  Future<void> init() async{
    var response = await Dio().get(
      'http://$ip/get_test?id=$id'
    );

    var json = response.data as Map<String, dynamic>;

    if (!json['success']) {
      return;
    }

    this.task = json['data']['Task'];
    this.startCode = (json['data']['StartCode'] as String).replaceAll('\\n', '\n').replaceAll('\\t', '\t');
    this.expectedResult = json['data']['ExpectedResult'];
    this.stdin = json['data']['Stdin'];
  }

  void editStartCode(){
    codeToShow = startCode!.substring(startCode!.lastIndexOf('#Место вставки\n'), startCode!.indexOf('#Конец места вставки'));
    print(codeToShow);
  }

  Future<Map<String, dynamic>> compile(String code) async{
    var json = {
      "expectedResult": expectedResult.toString(),
      "code": code.substring(code!.lastIndexOf('ь\n') + 1),
      "startCode": startCode!,
      "lang": "python",
      "stdin": "12 15",
      "type": "py"
    };

    var response = await Dio().post(
      'http://$ip/compile',
      data: json,
    );

    var data = response.data as Map<String, dynamic>;

    return data;
  }
}