import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kc54learning/Auth/Authorization.dart';
import 'package:kc54learning/Auth/f.dart';
import 'package:kc54learning/Themes/Theme.dart';
import 'package:kc54learning/Themes/bloc/cubit/theme_cubit.dart';

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
        )
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.brightness == Brightness.dark ? darkTheme : lightTheme,
            routes: {
              '/Authorization': (context) => Authorization(),
              '/Test':(context) => Test()
              },
            initialRoute: '/Test',
          );
        },
      ),
    );
  }
}
