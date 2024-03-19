import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(child: Container(), flex: 5,),
            Expanded(child: Image.asset('assets/backgroundAuthorization.png'), flex: 10,),
            Expanded(child: Container(), flex: 50,),
          ],
        ),
      )
    );
  }
}