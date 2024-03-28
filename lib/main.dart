import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kc54learning/Auth/authorization.dart';
import 'package:kc54learning/Auth/bloc/authorization_bloc.dart';
import 'package:kc54learning/Course/main_categories.dart';
import 'package:kc54learning/Course/many_categories.dart';
import 'package:kc54learning/Registration/registration.dart';
import 'package:kc54learning/Registration/registration_success.dart';
import 'package:kc54learning/Registration/registration_board_goals.dart';
import 'package:kc54learning/Registration/registartion_board_notifications.dart';
import 'package:kc54learning/Registration/registartion_board_level.dart';
import 'package:kc54learning/Registration/registration_board_time.dart';
import 'package:kc54learning/Themes/theme.dart';
import 'package:kc54learning/Themes/bloc/cubit/theme_cubit.dart';

import 'Registration/bloc/registration_block.dart';
import 'registration_plan_created.dart';
import 'Main/navigation_bar.dart';
import 'Registration/otp_verification.dart';

String ip = '83.147.245.57';

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
          create: (context) => AuthorizationBloc(),
        ),
        BlocProvider(
          create: (context) => RegistrationBloc(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.brightness == Brightness.light ? lightTheme : darkTheme,
            routes: {
              '/Auth': (context) => Authorization(),
              '/Registration': (context) => Registration(),
              '/OtpVerification':(context) => OtpVerification(),
              '/RegistrationBoardGoals':(context) => RegistrationBoardGoals(),
              '/RegistrationLevel':(context) => RegistrationLevel(),
              '/RegistrationTime':(context) => RegistrationTime(),
              '/RegistrationNotify':(context) => RegistrationBoardNotifications(),
              '/AuthAccepted':(context) => AuthAccepted(),
              '/RegistrationSuccess':(context) => RegistrationSuccess(),
              '/MainPage':(context) => MainPage(),
              '/Categories':(context) => Categories(),
              '/ManyCategories':(context) => ManyCategories()
              },
            initialRoute: '/Auth',
          );
        },
      ),
    );
  }
}
