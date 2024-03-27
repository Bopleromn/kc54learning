import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kc54learning/Auth/bloc/authorization_bloc.dart';
import 'package:kc54learning/Models/current_user_class.dart';
import 'package:kc54learning/Models/user_model.dart';
import 'package:kc54learning/Registration/bloc/registration_block.dart';
import 'package:kc54learning/Registration/bloc/registration_event.dart';
import 'package:kc54learning/Themes/styles.dart';
import 'package:kc54learning/helpers.dart';

import 'bloc/registration_state.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});
  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _registrationBloc = RegistrationBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<RegistrationBloc, RegistrationState>(
        bloc: _registrationBloc,
        listener: (BuildContext context, RegistrationState state) {
          if(state is RegistrationSuccess){
            showSnackBar(context, 'Код отправлен вам на почту');

            Navigator.of(context).pushNamed('/OtpVerification');
          }
          else if(state is RegistrationFailure){
            showSnackBar(context, 'Произошла ошибка');
          }
          else if(state is RegistrationIncorrectFields){
            showSnackBar(context, 'Поля заполнены не корректно');
          }
          else if(state is RegistrationLoading){
            showLoadingCircle(context);
          }
        },
        child: buildPage(),
      )
    );
  }

  Widget buildPage() {
    return Center(
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
            Expanded(child: Text('Регистрация', style: Theme.of(context).textTheme.titleLarge), flex: 7,),
            Expanded(child: Container(), flex: 1,),
            Expanded(child: Container(
              decoration: shadowBorder(Theme.of(context).shadowColor),
              child: TextField(
                controller: _emailController,
                decoration: fieldBorder('Адрес электронной почты'),
              ),
            ), flex: 8,),
            Expanded(child: Container(), flex: 3,),
            Expanded(child: Container(
              decoration: shadowBorder(Theme.of(context).shadowColor),
              child: TextField(
                controller: _nameController,
                decoration: fieldBorder('Имя'),
              ),
            ), flex: 8,),
            Expanded(child: Container(), flex: 3,),
            Expanded(child: Container(
              decoration: shadowBorder(Theme.of(context).shadowColor),
              child: TextField(
                controller: _ageController,
                decoration: fieldBorder('Возраст'),
              ),
            ), flex: 8,),
            Expanded(child: Container(), flex: 3,),
            Expanded(child: Container(
              decoration: shadowBorder(Theme.of(context).shadowColor),
              child: TextField(
                controller: _passwordController,
                decoration: fieldBorder('Пароль'),
              ),
            ), flex: 8,),
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
              onPressed: (){
                // Fill all fields
                CurrentUser.userModel.email = _emailController.text.toString();
                CurrentUser.userModel.name = _emailController.text.toString();
                CurrentUser.userModel.age = int.parse(_ageController.text.toString());
                CurrentUser.userModel.password = _passwordController.text.toString();

                _registrationBloc.add(Register());
              },
              child: Text('Создать аккаунт', style: TextStyle(color: Colors.white, fontSize: 20),),
              style: mainButton(Theme.of(context).primaryColor),
            ), flex: 7,),
            Expanded(child: Container(), flex: 5,),
          ],
        ),
      )
    );
  }
}