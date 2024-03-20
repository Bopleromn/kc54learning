import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class RegistrationBoardGoals extends StatefulWidget{
  @override
  State<RegistrationBoardGoals> createState() => _RegistrationBoardGoalsState();
}

class _RegistrationBoardGoalsState extends State<RegistrationBoardGoals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF1F5FF),
        foregroundColor: Theme.of(context).primaryColor,
        flexibleSpace: Expanded(child: Padding(
          padding: EdgeInsets.fromLTRB(40, 78, 40, 0),
          child: LinearPercentIndicator(
          percent: 0.25,
          linearGradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
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
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                children: [
                  Expanded(child: Image.asset('assets/mascott.png'), flex: 50,),
                  Expanded(child:
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Text(
                        'Выберите свою цель изучения, чтобы мы могли подобрать подходящее обучение в соответствии с вашими потребностями',
                          style: Theme.of(context).textTheme.titleSmall,
                      ),),
                  flex: 20,),
                  Expanded(child: GestureDetector(onTap: (){
                    Navigator.of(context).pushNamed('/RegistrationLevel');
                  },child: Image.asset('assets/forworkicon.png')), flex: 40,),
                  Expanded(child: GestureDetector(onTap: (){
                    Navigator.of(context).pushNamed('/RegistrationLevel');
                  },child: Image.asset('assets/forlearningicon.png')), flex: 40,),
                  Expanded(child: GestureDetector(onTap: (){
                    Navigator.of(context).pushNamed('/RegistrationLevel');
                  },child: Image.asset('assets/formyselficon.png')), flex: 40,),
                  Expanded(child: Container(), flex: 15,),
                ],
            ),
          )
      )
    );
  }
}