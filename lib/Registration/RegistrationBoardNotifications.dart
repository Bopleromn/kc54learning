import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class RegistrationBoardNotifications extends StatefulWidget{
  @override
  State<RegistrationBoardNotifications> createState() => _RegistrationBoardGoalsState();
}

class _RegistrationBoardGoalsState extends State<RegistrationBoardNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffF1F5FF),
          foregroundColor: Theme.of(context).primaryColor,
          flexibleSpace: Expanded(child: Padding(
            padding: EdgeInsets.fromLTRB(40, 78, 40, 0),
            child: LinearPercentIndicator(
              percent: 1,
              linearGradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffFFCB1D),
                  Color(0xffADFF2F)
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
                  Expanded(child: Image.asset('assets/mascottpractice.png'), flex: 50,),
                  Expanded(child:
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Text(
                      'SPARKS хотел бы отправлять вам уведомления. Уведомления могут включать в себя оповещания, звуки и значки-пиктограммы. Их можно настроить в настройках.',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),),
                    flex: 20,),
                  Expanded(child: Image.asset('assets/allowicon.png'), flex: 25,),
                  Expanded(child: Image.asset('assets/notallow.png'), flex: 25,),
                  Expanded(child: Container(), flex: 35,),
                ],
              ),
            )
        )
    );
  }
}