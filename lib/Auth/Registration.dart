import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
            Expanded(child: SvgPicture.asset('assets/SPARKS.svg'), flex: 10,),
            Expanded(child: Container(), flex: 50,),
            //
          ],
        ),
      )
    );
  }
}