import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class RegistrationTime extends StatelessWidget {
  const RegistrationTime({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
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
              Color(0xfffc7f),
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
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(
                children: [
                  Expanded(child: Image.asset('assets/Time.png'), flex: 50,),
                  Expanded(child:
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Text(
                        'Чем продолжительнее и интенсивнее занятия, тем быстрее и впечатляюще будет результат',
                          style: Theme.of(context).textTheme.titleSmall,
                      ),),
                  flex: 15,),
                  Expanded(child: GestureDetector(onTap: (){
                    Navigator.of(context).pushNamed('/');
                  },child: Image.asset('assets/30Min.png')), flex: 38,),
                  Expanded(child: GestureDetector(onTap: (){
                    Navigator.of(context).pushNamed('/');
                  },child: Image.asset('assets/45Min.png')), flex: 38,),
                  Expanded(child: GestureDetector(onTap: (){
                    Navigator.of(context).pushNamed('/');
                  },child: Image.asset('assets/ManyTime.png')), flex: 38,),
                  Expanded(child: Container(),flex: 8,)

                ],
            ),
          )
      )
    );;
  }
}