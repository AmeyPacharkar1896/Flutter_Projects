import 'package:flutter/material.dart';

final _testfieldcontroller = TextEditingController();

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TextFieldForm test",
        ),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _testfieldcontroller,
          ),
          
          TextButton(
            onPressed: () {},
            child: Text(_testfieldcontroller.text),
          ),
        ],
      ),
    );
  }
}
