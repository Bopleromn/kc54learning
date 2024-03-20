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

      ),
      body: Center(
        child: Container(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                children: [
                  Expanded(child: LinearPercentIndicator(
                      percent: 0.33,
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
                    flex: 3,
                  ),
                  Expanded(child: Image.asset('assets/mascott.png'), flex: 50,),
                  Expanded(child:
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Text(
                        'Выберите свою цель изучения, чтобы мы могли подобрать подходящее обучение в соответствии с вашими потребностями',
                          style: Theme.of(context).textTheme.titleSmall,
                      ),),
                  flex: 20,),
                  Expanded(child: Image.asset('assets/forworkicon.png'), flex: 50,),
                  Expanded(child: Image.asset('assets/forlearningicon.png'), flex: 50,),
                  Expanded(child: Image.asset('assets/formyselficon.png'), flex: 50,),
                  Expanded(child: Container(), flex: 5,),
                ],
            ),
          )
      )
    );
  }
}