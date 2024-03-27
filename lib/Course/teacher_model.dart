import 'package:dio/dio.dart';
import 'package:kc54learning/helpers.dart';

import '../main.dart';

class TeacherModel{
  int id;
  String? name;
  String? email;
  int? imageId;
  dynamic? photo;

  TeacherModel(this.id){
    init();
  }

  Future<void> init() async{
    final response = await Dio().get(
      'http://$ip/teacher_get?id=$id'
    );

    final data = response.data as Map<String, dynamic>;

    if(!data['success']){
      return;
    }

    this.name = data['data']['FullName'];
    this.email = data['data']['Email'];
    this.imageId = data['data']['IdImg'];

    this.photo = await initImage(this.imageId!);
  }
}