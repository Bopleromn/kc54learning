import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kc54learning/Themes/TextFieldStyles.dart';

class RegistrationSuccess extends StatelessWidget {
  const RegistrationSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: Container(),flex: 30,),
            Expanded(child: SvgPicture.asset('assets/Success.svg'), flex: 30,),
            Expanded(child: Text(textAlign: TextAlign.center,'Сохранить свой индивидуальный план', style: Theme.of(context).textTheme.titleMedium,),flex: 15,),
            Expanded(child: Container(),flex: 15,),
            Expanded(child: TextButton(onPressed: (){}, child: Text('Зарегестрироваться',style: Theme.of(context).textTheme.labelMedium,),style: mainButton(Colors.blueAccent),),flex: 6,),
            Expanded(child: Container(),flex: 5,)
          ],
        ),
      ),
    );
  }
}