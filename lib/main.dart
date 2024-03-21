import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kc54learning/Auth/Authorization.dart';
import 'package:kc54learning/AuthAccepted.dart';
import 'package:kc54learning/Registration/Registration.dart';
import 'package:kc54learning/Registration/RegistrationSuccess.dart';
import 'package:kc54learning/AuthorizationSuccess/AuthorizationSuccess.dart';
import 'package:kc54learning/AuthorizationSuccess/bloc/auth_success_bloc.dart';
import 'package:kc54learning/Registration/RegistrationBoardGoals.dart';
import 'package:kc54learning/Registration/RegistrationBoardNotifications.dart';
import 'package:kc54learning/Registration/RegistrationLevel.dart';
import 'package:kc54learning/Registration/RegistrationTime.dart';
import 'package:kc54learning/Themes/Theme.dart';
import 'package:kc54learning/Themes/bloc/cubit/theme_cubit.dart';
import 'package:kc54learning/codeEdit/codeEdit.dart';

import 'Main/Main.dart';
import 'Registration/OtpVerification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => AuthSuccessBloc(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.brightness == Brightness.light ? lightTheme : darkTheme,
            routes: {
              '/Authorization': (context) => Authorization(),
              '/Registration': (context) => Registration(),
              '/OtpVerification':(context) => OtpVerification(),
              '/RegistrationBoardGoals':(context) => RegistrationBoardGoals(),
              '/RegistrationLevel':(context) => RegistrationLevel(),
              '/RegistrationTime':(context) => RegistrationTime(),
              '/RegistrationNotify':(context) => RegistrationBoardNotifications(),
              '/AuthAccepted':(context) => AuthAccepted(),
              '/RegistrationSuccess':(context) => RegistrationSuccess(),
              '/Main':(context) => MainPage(),
              },
            initialRoute: '/Registration',
          );
        },
      ),
    );
  }
}
