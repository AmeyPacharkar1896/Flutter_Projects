// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Call extends StatelessWidget {
  const Call({super.key, required this.input});

  final String input;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
      child: Center(
        child: Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          child: Center(child: Text(
            input,
            style: TextStyle(
              fontSize: 30,
            ),
            )),
        ),
      ),
    );
  }
}
