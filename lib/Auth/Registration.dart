import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kc54learning/Models/StaticUserModel.dart';
import 'package:kc54learning/Models/UserModel.dart';
import 'package:kc54learning/Themes/TextFieldStyles.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});
  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: 30, right: 30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xfff5f8ff),
                  Color(0xffA2AFC2),
                ]
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: Container(), flex: 15,),
              Center(child:  Expanded(child: SvgPicture.asset('assets/SPARKS.svg'), flex: 10,),),
              Expanded(child: Container(), flex: 3,),
              Expanded(child: Text('Регистрация', style: textTheme.titleLarge), flex: 7,),
              Expanded(child: Container(), flex: 1,),
              Expanded(child: Container(
                decoration: shadowBorder(colors.shadowColor),
                child: TextField(
                  controller: _emailController,
                  decoration: fieldBorder('Адрес электронной почты'),
                ),
              ), flex: 10,),
              Expanded(child: Container(), flex: 3,),
              Expanded(child: Container(
                decoration: shadowBorder(colors.shadowColor),
                child: TextField(
                  controller: _nameController,
                  decoration: fieldBorder('Имя'),
                ),
              ), flex: 10,),
              Expanded(child: Container(), flex: 3,),
              Expanded(child: Container(
                decoration: shadowBorder(colors.shadowColor),
                child: TextField(
                  controller: _ageController,
                  decoration: fieldBorder('Возраст'),
                ),
              ), flex: 10,),
              Expanded(child: Container(), flex: 3,),
              Expanded(child: Container(
                decoration: shadowBorder(colors.shadowColor),
                child: TextField(
                  controller: _passwordController,
                  decoration: fieldBorder('Пароль'),
                ),
              ), flex: 10,),
              Expanded(child: Container(), flex: 3,),
              Expanded(child: Container(), flex: 2,),
              Expanded(child: RichText(
                text: TextSpan(
                    children: [
                      TextSpan(text: 'Регистрируясь, вы соглашаетесь с ', style: TextStyle(color: Colors.black, fontSize: 18)),
                      TextSpan(text: 'политикой конфиденциальности', style: TextStyle(color: Colors.blue, fontSize: 18)),
                      //
                    ]),
              ),
              flex: 10,),
              Expanded(child: ElevatedButton(
                onPressed: (){Navigator.of(context).pushNamed('/RegistrationBoardGoals');},
                child: Text('Создать аккаунт', style: TextStyle(color: Colors.white, fontSize: 20),),
                style: mainButton(colors.primaryColor),
              ), flex: 7,),
              Expanded(child: Container(), flex: 5,),
            ],
          ),
        )
      )
    );
  }
  Future<void> acceptmail() async{
    final regex = RegExp(r"(^[\w]+@[A-Za-z]{2,10}.[A-Za-z]{2,7}$)");
    if(regex.hasMatch(_emailController.text.toString()) && _phoneNumberController.text.toString().length > 8 &&
        _nameController.text.toString().length > 3 && _ageController.text.toString().length > 0 && _passwordController.text.toString().length > 5){
      StaticUserModel.userModel.email = _emailController.text.toString();
      StaticUserModel.userModel.name = _emailController.text.toString();
      StaticUserModel.userModel.age = int.parse(_ageController.text.toString());
      StaticUserModel.userModel.password = _passwordController.text.toString();

      if(await StaticUserModel.userModel.checkMail() == true){
        print('Регистрация начата');
      }
      else{
        print('Регистрация не начата');
      }
    }
  }
}
