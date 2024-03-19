import 'package:flutter/material.dart';
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
          padding: EdgeInsets.fromLTRB(75, 0, 75, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: Container(), flex: 5,),
              Center(child:  Expanded(child: SvgPicture.asset('assets/SPARKS.svg'), flex: 10,),),
              Expanded(child: Container(), flex: 10,),
              Expanded(child: Text('Вход', style: TextStyle(fontSize: 35)), flex: 7,),
              Expanded(child: Text('Это сохранит ваш прогресс', style: TextStyle(fontSize: 20)), flex: 5,),
              Expanded(child: Container(), flex: 1,),
              Expanded(child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Адрес электронной почты'
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
              Expanded(child: Container(), flex: 50,),
              //

            ],
          ),
        )
      )
    );
  }
}