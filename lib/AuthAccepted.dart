import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AuthAccepted extends StatefulWidget {
  const AuthAccepted({super.key});
  @override
  State<AuthAccepted> createState() => _AuthAcceptedState();
}

class _AuthAcceptedState extends State<AuthAccepted> {
    @override
    initState() {
    super.initState();
    sleepfunc();
  }
  Future<void> sleepfunc  () async{
   await Future.delayed(Duration(seconds: 4));
   Navigator.of(context).pushNamed('/RegistrationSuccess');
  }
  @override
  Widget build(BuildContext context) { 
          return Scaffold(
            backgroundColor: Color(0xffF1F5FF),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(),
                    flex: 20,
                  ),
                  Expanded(
                    child: CircularPercentIndicator(
                      radius: 70,
                      percent: 1,
                      animation: true,
                      animationDuration: 3000,
                      progressColor: Color(0xffF7AA2D),
                    ),
                    flex: 30,
                  ),
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Составляем индивидуальный план!',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    flex: 15,
                  ),
                  Expanded(
                    child: Container(),
                    flex: 30,
                    ),
                ],
              ),
            ),
          );
  }
}

