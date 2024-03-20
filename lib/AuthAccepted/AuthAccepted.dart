import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kc54learning/AuthAccepted/bloc/auth_accepted_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AuthAccepted extends StatefulWidget {
  const AuthAccepted({super.key});

  @override
  State<AuthAccepted> createState() => _AuthAcceptedState();
}

class _AuthAcceptedState extends State<AuthAccepted> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthAcceptedBloc(),
      child: BlocBuilder<AuthAcceptedBloc, AuthAcceptedState>(
        builder: (context, state) {
          if(state is AuthAcceptedLoading){

          }
          if(state is AuthAcceptedLoaded){
            print('asdsda');
          }
          return Scaffold(
              body: Container(
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: Container(),flex: 20,),
                    Expanded(child: Container(),flex: 30,),
                    Expanded(child: Container(),flex: 20,),
                    Expanded(child: Container(),flex: 30,)
                  ],
                ),
              ),
          );
        },
      ),
    );
  }
}

class CircleWidget extends StatefulWidget{
  @override
  State<CircleWidget> createState() => _CircleWidgetState();
}

class _CircleWidgetState extends State<CircleWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CircularPercentIndicator(
        radius: 60.0,
        animation: true,
      ),
    );
  }
}