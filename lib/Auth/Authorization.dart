import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kc54learning/Themes/bloc/cubit/theme_cubit.dart';

class Authorization extends StatefulWidget {
  const Authorization({super.key});

  @override
  State<Authorization> createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final brightness = context.watch<ThemeCubit>().state.brightness;
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CupertinoSwitch(value: brightness == Brightness.dark, onChanged: (value){
              context.read<ThemeCubit>().SetThemeBrightness(value ? Brightness.dark : Brightness.light);
            }),
            TextButton(onPressed: (){
              Navigator.of(context).pushNamed('/Test');
            }, child: Text('NextPage'))
          ],
        ),
      ),
    );
  }
}