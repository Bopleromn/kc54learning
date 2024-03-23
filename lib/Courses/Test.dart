import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kc54learning/Courses/CourseModel.dart';
import 'package:kc54learning/Themes/TextFieldStyles.dart';
import 'package:kc54learning/Themes/Theme.dart';
import 'package:flutter/material.dart';
import 'package:highlight/languages/dart.dart' as mode;

import 'TestModel.dart';

class Test extends StatefulWidget{
  @override
  State<Test> createState() => _TestState(course);

  CourseModel? course;

  Test(CourseModel course){
    this.course = course;
  }
}

class _TestState extends State<Test> {
  CourseModel? course;

  final terminalOutputController = TextEditingController();

  CodeController? _codeController;

  _TestState(CourseModel? course){
    this.course = course;

    _codeController = CodeController(
      language: mode.dart,
      text: course!.test!.codeToShow,
    );
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       centerTitle: true,
       title: Text(course!.title, style: Theme.of(context).textTheme.titleMedium,textAlign: TextAlign.center,),
       iconTheme: IconThemeData(
           color: Colors.blueAccent
       ),
     ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffFFFFFF),
                Color(0xffCBD9FF),
                Color(0xffC6D5FF),
              ]
          ),
      ),
       child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Text(
                  course!.test!.task!,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                flex: 6),
            Expanded(
              child:SingleChildScrollView(child:  CodeField(
                background: Colors.white,
                controller: _codeController!,
                cursorColor: Colors.black,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                ),
                lineNumberStyle: LineNumberStyle(textStyle: TextStyle(fontFamily: 'SourceCode', fontSize: 20, color: Colors.black),),
                textStyle: TextStyle(fontFamily: 'SourceCode', fontSize: 20, color: Colors.black),
              ),),
             flex: 8),
            Expanded(child: Text('Подсказка(Не удаляйте комментарии и главную функцию, без них код не будет интерпритирован)', style: Theme.of(context).textTheme.titleSmall,), flex: 2,),
            Expanded(
                child: ElevatedButton(style: mainButton(Colors.green), onPressed: sendToCompilation, child: Text('Отправить', style: Theme.of(context).textTheme.headlineMedium,),),
              flex: 1
            ),
            Expanded(child: Text('Окно вывода', style: Theme.of(context).textTheme.titleSmall,), flex: 1,),
            Expanded(
              child: TextField(
                controller: terminalOutputController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                expands: true,
                decoration: fieldBorder(''),
                readOnly: true,
              ),
              flex: 6,
            ),
            Expanded(child: Container(), flex: 1,),
            Expanded(
                child: Center(child: ElevatedButton(style: mainButton(Theme.of(context).primaryColor), onPressed: () {  }, child: Text('Завершить', style: Theme.of(context).textTheme.headlineMedium,)),),
                flex: 1
            ),
            Expanded(child: Container(), flex: 1,),
          ],
        )
      ),
   );
  }
  
  Future<void> sendToCompilation() async{
    final json = await course!.test!.compile(_codeController!.text);

    setState(() {
      terminalOutputController.text = 'Входные данные: ${course!.test!.stdin}\n';
      try {
        if (json['success']) {
          if (json['data']['Output'] == json['data']['Expected']) {
            terminalOutputController.text +=
            'Ожидалось: ${course!.test!.expectedResult}\nВывод: ${course!.test!
                .expectedResult}';
          }
          else {
            terminalOutputController.text +=
            'Ожидалось: ${course!.test!
                .expectedResult}\nВывод: ${json['data']['Output']}';
          }
        }
        else {
         throw Error();
        }
      }
      catch (e){
        terminalOutputController.text +=
        'Ожидалось: ${course!.test!.expectedResult}\nВывод: Ошибка';
      }
    });
  }
}