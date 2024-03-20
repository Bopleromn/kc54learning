import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final messageController;
  @override
  void initState() {
    super.initState();
    messageController = TextEditingController();
  }
  @override
  void dispose() {
    messageController.dispose;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Form(
            child: TextFormField(
              controller: messageController,
              textInputAction: TextInputAction.send,
              onFieldSubmitted: (value){
              },
              decoration: InputDecoration(
                hintText: 'Введите сообщение',
                contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                hintStyle: TextStyle(
                  fontSize: 18
                ),
                border: InputBorder.none
              ),
          )),
        ),
        SizedBox(),
        CircleAvatar (
       backgroundColor: Colors.blueAccent,
        radius: 20, 
        child: IconButton (
        icon: const Icon (Icons. send, color: Colors.white,), 
        onPressed: (){})),
      ],
    );
  }
}