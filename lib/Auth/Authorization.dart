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

class Authorization extends StatefulWidget {
  const Authorization({super.key});
  @override
  State<Authorization> createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  TextEditingController _emailController = TextEditingController();
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
                  Expanded(child: Text('Вход', style: textTheme.titleLarge), flex: 7,),
                  Expanded(child: Text('Это сохранит ваш прогресс', style: textTheme.titleMedium), flex: 5,),
                  Expanded(child: Container(), flex: 3,),
                  Expanded(child: Container(
                    decoration: shadowBorder(colors.shadowColor),
                    child: TextField(
                      controller: _emailController,
                      decoration: fieldBorder('Адрес электронной почты'),
                    ),
                  ), flex: 10,),
                  Expanded(child: Container(), flex: 5,),
                  Expanded(child: Container(
                    decoration: shadowBorder(colors.shadowColor),
                    child: TextField(
                      controller: _passwordController,
                      decoration: fieldBorder('Пароль'),
                    ),
                  ), flex: 10,),
                  Expanded(child: Container(), flex: 5,),
                  Expanded(child: ElevatedButton(
                    onPressed: authorizate,
                    child: Text('Войти', style: TextStyle(color: Colors.white, fontSize: 20),),
                    style: mainButton(colors.primaryColor),
                  ), flex: 7,),
                  Expanded(child: Container(), flex: 3,),
                  Expanded(child: Text('Или войти через', style: TextStyle(fontSize: 20)), flex: 7,),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/gosuslugi.png',),
                      Image.asset('assets/google.png',),
                      Image.asset('assets/vk.png',),
                    ],
                  ),
                    flex: 8,
                  ),
                  Expanded(child: Container(), flex: 3,),
                  Expanded(child: Center(child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Нет аккаунта?', style: TextStyle(color: Colors.black, fontSize: 18)),
                          TextButton(onPressed: (){
                            Navigator.of(context).pushNamed('/Registration');
                          }, child:
                            Text('Зарегистрируйтесь', style: TextStyle(color: Colors.blue, fontSize: 18)),
                          ),
                        ],
                      )
                  ),
                    flex: 10,),
                  Expanded(child: Container(), flex: 10,),
                ],
              ),
            )
        )
    );
  }
  Future<void> authorizate() async{
    StaticUserModel.userModel.email = _emailController.text.toString();
    StaticUserModel.userModel.password = _passwordController.text.toString();

    if(await StaticUserModel.userModel.authorization() == true){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Вход выполнен'),
          backgroundColor: Colors.grey,
        ),
      );

      Navigator.of(context).pushNamed('/Main');
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Неверный логин или пароль'),
            backgroundColor: Colors.grey,
        ),
      );
    }
  }
}
