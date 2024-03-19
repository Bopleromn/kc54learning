import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum PaymentStatus {
  initial,
  loading,
  success,
}

class success extends StatefulWidget{
  @override
  State<success> createState() => _successState();
}

class _successState extends State<success> {
  var _status = PaymentStatus.initial;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
    // return Scaffold(
    //   body: _status == PaymentStatus.success ?
    //         Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Center(
    //               child: SizedBox(
    //                 height: 150,
    //                 width: 150,
    //                 child: RiveAnimation.asset(
    //                   'assets/success.riv',
    //                   onInit: (artboard) => setState(() {
    //                     final controller = StateMachineController.fromArtboard(artboard, 'State Machine 1');
    //                     artboard.addController(controller as RiveAnimationController);
    //                   }),
    //                 ),
    //               ),
    //             )
    //           ],
    //         )
    //   : SizedBox()
    // );
  }
}