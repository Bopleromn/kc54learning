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
          final bloccommand = BlocProvider.of<AuthAcceptedBloc>(context);
          if(state is AuthAcceptedLoading){
            widgetCircularIndicator();
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
                    Expanded(child: Container(
                      child:  widgetCircularIndicator(),
                    ),flex: 30,),
                    Expanded(child: Container(),flex: 20,),
                    Expanded(child: TextButton(onPressed: (){
                      bloccommand.add(AuthAcceptedEvent());
                    }, child: Text('dsasddsad'),),flex: 30,)
                  ],
                ),
              ),
          );
        },
      ),
    );
  }
}

class widgetCircularIndicator extends StatelessWidget {
  const widgetCircularIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(radius: 60, animation: true,animationDuration: 10000,);
  }
}