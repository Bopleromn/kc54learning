import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class RegistrationLevel extends StatelessWidget {
  const RegistrationLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF1F5FF),
        foregroundColor: Theme.of(context).primaryColor,
        flexibleSpace: Expanded(child: Padding(
          padding: EdgeInsets.fromLTRB(40, 78, 40, 0),
          child: LinearPercentIndicator(
          percent: 0.5,
          linearGradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xffF7AA2D),
              Color(0xffFFCB1D),
            ],
          ),
          lineHeight: 15.0,
          barRadius: Radius.circular(10),
        ),
        ),
          flex: 3,
        ),
      ),
      body: Center(
        child: Container(
              color: Color(0xffF1F5FF),
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(
                children: [
                  Expanded(child: Image.asset('assets/Level.png'), flex: 50,),
                  Expanded(child:
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Text(
                        'Если вы не уверены в уровне знаний, попробуйте уровень для начинающих. Вв можете изменить уровень во время учёбы.',
                          style: Theme.of(context).textTheme.titleSmall,
                      ),),
                  flex: 20,),
                  Expanded(child: GestureDetector(onTap: (){
                    Navigator.of(context).pushNamed('/RegistrationTime');
                  },child: Image.asset('assets/StartLevel.png')), flex: 38,),
                  Expanded(child: GestureDetector(onTap: (){
                    Navigator.of(context).pushNamed('/RegistrationTime');
                  },child: Image.asset('assets/MediumLevel.png')), flex: 38,),
                  Expanded(child: GestureDetector(onTap: (){
                    Navigator.of(context).pushNamed('/RegistrationTime');
                  },child: Image.asset('assets/HighLevel.png')), flex: 38,),
                  Expanded(child: GestureDetector(onTap: (){
                    Navigator.of(context).pushNamed('/RegistrationTime');
                  },child: Image.asset('assets/DontHaveLevel.png')), flex: 38,),
                  Expanded(child: Container(),flex: 8,)

                ],
            ),
          )
      )
    );
  }
}