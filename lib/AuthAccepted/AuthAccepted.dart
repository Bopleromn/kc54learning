import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kc54learning/AuthAccepted/bloc/auth_accepted_bloc.dart';

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
              Navigator.of(context).pushNamed('');
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
