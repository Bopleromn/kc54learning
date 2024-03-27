import 'package:dio/dio.dart';

import '../main.dart';

class UserModel{
  int? id;
  String? email;
  String? password;
  String? name;
  int? age;
  String? verificationCode;

  Future<bool> authorization() async{
    final response = await Dio().get(
        'http://$ip/user_get?email=${this.email}&password=${this.password}'
    );

    final json = response.data as Map<String, dynamic>;

    if(!json['success']){
      return false;
    }

    this.id = json['data']['Id'];
    this.email = json['data']['Email'];
    this.password = json['data']['Password'];
    this.name = json['data']['Name'];
    this.age = json['data']['Age'];

    return true;
  }

  Future<bool> register() async{
    final json = new Map<String,dynamic>();

    json['Id'] = this.id;
    json['Email'] = this.email!;
    json['Password'] = this.password!;
    json['Name'] = this.name!;
    json['Age'] = this.age!;

    final response = await Dio().post(
        'http://$ip/user_add', data: json
    );

    final jsonResponse = response.data as Map<String,dynamic>;

    return jsonResponse['success'];
  }

  Future<bool> checkMail() async{
    final response = await Dio().get(
      'http://$ip/send_vc?email=${this.email}'
    );

    final json = response.data as Map<String, dynamic>;
    
    if(!json['success']){
      return false;
    }
    else{
      return true;
    }
  }

  Future<bool> checkVerificationCode() async{
    final response = await Dio().get(
      'http://$ip/check_vc?verificationCode=${verificationCode}&email=${email}'
    );

    final json = response.data as Map<String, dynamic>;

    if(!json['success']){
      return false;
    }
    else{
      return true;
    }
  }
}