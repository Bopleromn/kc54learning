import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kc54learning/Auth/bloc/authorization_bloc.dart';
import 'package:kc54learning/Auth/bloc/authorization_event.dart';
import 'package:kc54learning/Models/current_user_class.dart';
import 'package:kc54learning/Themes/styles.dart';
import 'package:kc54learning/helpers.dart';

import 'bloc/authorization_state.dart';

class Authorization extends StatefulWidget {
  const Authorization({super.key});
  @override
  State<Authorization> createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _authorizationBloc = AuthorizationBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<AuthorizationBloc, AuthorizationState>(
          bloc: _authorizationBloc,
          listener: (context, state){
            if(state is AuthorizationSuccess){
              Navigator.of(context).pop();
              showSnackBar(context, 'Вы успешно вошли');

              Navigator.of(context).pushNamed('/MainPage');
            }
            else if(state is AuthorizationFailure){
              Navigator.of(context).pop();
              showSnackBar(context, 'Неверный логин или пароль');
            }
            else if(state is AuthorizationLoading){
              showLoadingCircle(context);
            }
          },
          child: authorizationPage()
        )
    );
  }

  Widget authorizationPage() {
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
            Expanded(child: Text('Вход', style: Theme.of(context).textTheme.titleLarge), flex: 7,),
            Expanded(child: Text('Это сохранит ваш прогресс', style: Theme.of(context).textTheme.titleMedium), flex: 5,),
            Expanded(child: Container(), flex: 3,),
            Expanded(child: Container(
              decoration: shadowBorder(Theme.of(context).shadowColor),
              child: TextField(
                controller: _emailController,
                decoration: fieldBorder('Адрес электронной почты'),
              ),
            ), flex: 10,),
            Expanded(child: Container(), flex: 5,),
            Expanded(child: Container(
              decoration: shadowBorder(Theme.of(context).shadowColor),
              child: TextField(
                controller: _passwordController,
                decoration: fieldBorder('Пароль'),
              ),
            ), flex: 10,),
            Expanded(child: Container(), flex: 5,),
            Expanded(child: ElevatedButton(
              onPressed: (){
                CurrentUser.userModel.email = _emailController.text.toString();
                CurrentUser.userModel.password = _passwordController.text.toString();

                _authorizationBloc.add(AuthorizationLoad());
              },
              child: Text('Войти', style: TextStyle(color: Colors.white, fontSize: 20),),
              style: mainButton(Theme.of(context).primaryColor),
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
    );
  }
}