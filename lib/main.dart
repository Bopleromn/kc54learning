import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kc54learning/Auth/Authorization.dart';
import 'package:kc54learning/Auth/OTPVerification.dart';
import 'package:kc54learning/Auth/Registration.dart';
import 'package:kc54learning/AuthorizationSuccess/AuthorizationSuccess.dart';
import 'package:kc54learning/AuthorizationSuccess/bloc/auth_success_bloc.dart';
import 'package:kc54learning/MainMenu/MainMenuPage.dart';
import 'package:kc54learning/Themes/Theme.dart';
import 'package:kc54learning/Themes/bloc/cubit/theme_cubit.dart';
import 'package:kc54learning/codeEdit/codeEdit.dart';

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
        )
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.brightness == Brightness.light ? lightTheme : darkTheme,
            routes: {
              '/Authorization': (context) => Authorization(),
              '/Registration': (context) => Registration(),
              '/Test':(context) => AuthorizationSucces(),
              '/codeEdit':(context) => codeEdit(),
              '/OTP':(context) => OTPVerification(),
              '/MainMenu':(context) => MainMenuPage()
              },
            initialRoute: '/MainMenu',
          );
        },
      ),
    );
  }
}
