import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:kc54learning/helpers.dart';

import 'teacher_model.dart';
import 'test_model.dart';

class CourseModel{
  int id;
  String title;
  String desc;
  String videoUrl;
  int idPhoto;
  int idTeacher;
  int idTest;
  dynamic photo;

  TeacherModel? teacher;
  TestModel? test;

  CourseModel(this.id, this.title, this.desc, this.videoUrl, this.idPhoto,  this.idTeacher, this.idTest){
    this.teacher = TeacherModel(this.idTeacher);
    this.test = TestModel(this.idTest);

    setImage();
  }

  void setImage() async{
    this.photo = await initImage(idPhoto);
  }
}