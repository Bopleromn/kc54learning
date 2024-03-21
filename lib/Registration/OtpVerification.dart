import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kc54learning/Models/StaticUserModel.dart';
import 'package:kc54learning/Models/UserModel.dart';
import 'package:kc54learning/Themes/TextFieldStyles.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});
  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final _pin1 = TextEditingController();
  final _pin2  = TextEditingController();
  final _pin3  = TextEditingController();
  final _pin4  = TextEditingController();
  final _pin5  = TextEditingController();
  final _pin6  = TextEditingController();

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
                  Expanded(child: Text('Код отправлен на вашу почту', style: textTheme.titleLarge), flex: 7,),
                  Expanded(child: Container(), flex: 1,),
                  Expanded(child: Text('Введите код', style: textTheme.titleMedium), flex: 7,),
                  Expanded(child: Container(), flex: 3,),
          Expanded(flex: 10,child:
          Form(child:     Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 55,
                  width: 55,
                  child: TextFormField(
                    onChanged: (value){
                      if(value.length == 1){
                        FocusScope.of(context).nextFocus();
                      }
                      else if(value.length == 0 ){
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    controller: _pin1,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: fieldBorder(''),
                  ),
                ),
                SizedBox(
                  height: 55,
                  width: 55,
                  child: TextFormField(
                    onChanged: (value){
                      if(value.length == 1){
                        FocusScope.of(context).nextFocus();
                      }
                      else if(value.length == 0 ){
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    controller: _pin2,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: fieldBorder(''),
                  ),
                ),
                SizedBox(
                  height: 55,
                  width: 55,
                  child: TextFormField(
                    onChanged: (value){
                      if(value.length == 1){
                        FocusScope.of(context).nextFocus();
                      }
                      else if(value.length == 0 ){
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    controller: _pin3,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: fieldBorder(''),
                  ),
                ),
                SizedBox(
                  height: 55,
                  width: 55,
                  child: TextFormField(
                    onChanged: (value){
                      if(value.length == 1){
                        FocusScope.of(context).nextFocus();
                      }
                      else if(value.length == 0 ){
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    controller: _pin4,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: fieldBorder(''),
                  ),
                ),
                SizedBox(
                  height: 55,
                  width: 55,
                  child: TextFormField(
                    onChanged: (value){
                      if(value.length == 1){
                        FocusScope.of(context).nextFocus();
                      }
                      else if(value.length == 0 ){
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    controller: _pin5,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: fieldBorder(''),
                  ),
                ),
                SizedBox(
                  height: 55,
                  width: 55,
                  child: TextFormField(
                    onChanged: (value){
                      if(value.length == 1){
                        FocusScope.of(context).nextFocus();
                      }
                      else if(value.length == 0 ){
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    controller: _pin6,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: fieldBorder(''),
                  ),
                ),
              ]),)),
                  Expanded(child: Container(), flex: 50,),
                  Expanded(child: ElevatedButton(
                    onPressed: checkVC,
                    child: Text('Проверить код', style: TextStyle(color: Colors.white, fontSize: 20),),
                    style: mainButton(colors.primaryColor),
                  ), flex: 7,),
                  Expanded(child: Container(), flex: 5,),
                ],
              ),
            )
        )
    );
  }

  Future<void> checkVC() async {
    StaticUserModel.userModel.verificationCode = _pin1.text + _pin2.text + _pin3.text + _pin4.text + _pin5.text + _pin6.text;

    if(StaticUserModel.userModel.verificationCode!.length == 6 && await StaticUserModel.userModel.checkVerificationCode()){
      if(await StaticUserModel.userModel.register()){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Вы успешно зарегистрировались'),
          backgroundColor: Colors.grey,
          ),
        );

        Navigator.of(context).pushNamed('/RegistrationBoardGoals');
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Не получилось зарегистрироваться'),
          backgroundColor: Colors.grey,
        ),
        );
      }
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Код введен не корректно'),
          backgroundColor: Colors.grey,
        ),
      );
    }
  }
}