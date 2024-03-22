import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kc54learning/AuthorizationSuccess/bloc/auth_success_bloc.dart';

class AuthorizationSucces extends StatefulWidget {
  const AuthorizationSucces({super.key});

  @override
  State<AuthorizationSucces> createState() => _AuthorizationSuccesState();
}

class _AuthorizationSuccesState extends State<AuthorizationSucces> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloccommand = BlocProvider.of<AuthSuccessBloc>(context);
    return BlocProvider(
      create: (context) => AuthSuccessBloc(),
      child: BlocBuilder<AuthSuccessBloc, AuthSuccessState>(
        builder: (context, state) {
          if(state is AuthSuccessLoading){
            Navigator.of(context).pushNamed('/MenuPage');
          }
          if(state is AuthSuccessLoaded){
            Navigator.of(context).pushNamed('/MenuPage');
          }
          return Scaffold(
            appBar: AppBar(),
            backgroundColor: Theme.of(context).backgroundColor,
            body: Column(
              children: [
                      TextButton(
                      onPressed: () {
                        bloccommand.add(AuthSuccessEvent());
                      },
                      child: Text('тест')),
              ],
            ),
          );
        },
      ),
    );
  }
}
