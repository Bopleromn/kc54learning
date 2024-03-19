import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
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
              Expanded(child: Container(), flex: 10,),
              Expanded(child: Text('Вход', style: Theme.of(context).textTheme.titleLarge), flex: 7,),
              Expanded(child: Text('Это сохранит ваш прогресс', style: Theme.of(context).textTheme.titleMedium), flex: 5,),
              Expanded(child: Container(), flex: 1,),
              Expanded(child: Container(
                   decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 7,
                      spreadRadius: 5,
                      offset: Offset(0, 4)
                    )
                  ]
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Адрес электронной почты',
                  ),
                ),
              ), flex: 10,),
              Expanded(child: Container(), flex: 1,),
              Expanded(child: Text('Номер телефона', style: TextStyle(fontSize: 20, color: Colors.blue)), flex: 5,),
              Expanded(child: Container(), flex: 2,),
              Expanded(child: ElevatedButton(
                onPressed: (){},
                child: Text('Создать аккаунт', style: TextStyle(color: Colors.white, fontSize: 20),),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.blue,
                ),
              ), flex: 7,),
              Expanded(child: Container(), flex: 3,),
              Expanded(child: Text('Или войти через', style: TextStyle(fontSize: 20)), flex: 7,),
              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/gosuslugi.png',),
                    Image.asset('assets/google.png',),
                    Image.asset('assets/vk.png',),
                    Image.asset('assets/yandex.png',),
                  ],
                ),
                flex: 10,
              ),
              Expanded(child: Container(), flex: 3,),
              Expanded(child: RichText(
                text: TextSpan(
                    children: [
                      TextSpan(text: 'Регистрируясь, вы соглашаетесь с ', style: TextStyle(color: Colors.black, fontSize: 18)),
                      TextSpan(text: 'политикой конфиденциальности', style: TextStyle(color: Colors.blue, fontSize: 18)),
                    ]),
              ),
              flex: 10,),
              Expanded(child: Container(), flex: 10,),
            ],
          ),
        )
      )
    );
  }
}
