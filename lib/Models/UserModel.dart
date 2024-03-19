import 'package:dio/dio.dart';

class UserModel{
  UserModel(String email, String password){
    this.email = email;
    this.password = password;
  }
  UserModel.empty(){}

  UserModel.full(String email, String password, String name){
    this.email = email;
    this.password = password;
    this.name = name;
  }

  int? id;
  String? email;
  String? password;
  String? name;

  Future<bool> authorization() async{
    final response = await Dio().get(
        'http://83.147.245.57/user_get?email=${this.email}&password=${this.password}'
    );

    final json = response.data as Map<String, dynamic>;

    if(!json['success']){
      return false;
    }

    this.id = json['data']['Id'];
    this.email = json['data']['Email'];
    this.password = json['data']['Password'];
    this.name = json['data']['Name'];

    return true;
  }

  Future<bool> register() async{
    final json = new Map<String,dynamic>();

    json['Id'] = this.id;
    json['Email'] = this.email!;
    json['Password'] = this.password!;
    json['Name'] = this.name!;

    final response = await Dio().post(
        'http://83.147.245.57/user_add', data: json
    );

    final jsonResponse = response.data as Map<String,dynamic>;

    return jsonResponse['success'];
  }
  Future<bool> checkMail() async{
    final response = await Dio().get(
      'http://83.147.245.57/send_vc?email=${this.email}'
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