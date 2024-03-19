import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:highlight/languages/dart.dart';
import 'package:highlight/languages/python.dart';
import 'package:highlight/languages/cpp.dart';

class codeEdit extends StatefulWidget {
  const codeEdit({super.key});

  @override
  State<codeEdit> createState() => _codeEditState();
}

class _codeEditState extends State<codeEdit> {
      CodeController? _codeController;
  @override
  Widget build(BuildContext context) {
   String source = "void main() {\n    print(\"Hello, world!\");\n}";

    // Instantiate the CodeController
    _codeController = CodeController(
      text: source,
      language: cpp,
    );

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: CodeField(
            controller: _codeController!,
            textStyle: TextStyle(fontFamily: 'SourceCode', fontSize: 20),
          )
        ),
      ),
    );
  }
  }
