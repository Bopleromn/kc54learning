import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:kc54learning/Helpers.dart';

import 'TeacherModel.dart';

class CourseModel{
  int id;
  String title;
  String desc;
  String videoUrl;
  int idPhoto;
  int idTeacher;
  dynamic? photo;

  TeacherModel? teacher;

  CourseModel(this.id, this.title, this.desc, this.videoUrl, this.idPhoto,  this.idTeacher){
    this.teacher = TeacherModel(this.idTeacher, 'assets/kirill.png');

    setImage();
  }

  void setImage() async{
    this.photo = await initImage(idPhoto);
  }
}