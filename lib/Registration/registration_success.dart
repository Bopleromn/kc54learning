import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kc54learning/Themes/styles.dart';

class RegistrationSuccess extends StatefulWidget {
  const RegistrationSuccess({super.key});

  @override
  State<RegistrationSuccess> createState() => _RegistrationSuccessState();
}

class _RegistrationSuccessState extends State<RegistrationSuccess> {
    void getTime() async {
    Navigator.pushNamed(context, '/Registration');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffF1F5FF),
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: Container(),flex: 30,),
            Expanded(child: SvgPicture.asset('assets/Success.svg'), flex: 30,),
            Expanded(child: Text(textAlign: TextAlign.center,'Мы сохранили ваш индивидуальный план', style: Theme.of(context).textTheme.titleMedium,),flex: 15,),
            Expanded(child: Container(),flex: 15,),
            Expanded(child: TextButton(onPressed: (){
              Navigator.of(context).pushNamedAndRemoveUntil('/Auth', (Route<dynamic> route) => false);
            }, child: Text('Авторизоваться',style: Theme.of(context).textTheme.headlineMedium,),style: mainButton(Colors.blueAccent),),flex: 6,),
            Expanded(child: Container(),flex: 5,)
          ],
        ),
      ),
    );
  }
}