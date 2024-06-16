import 'package:flutter/material.dart';

void main() {
  String name = 'Amey';
  runApp(Container(
  width: 100,
  decoration: BoxDecoration(border: Border.all()),
  child: Text(overflow: TextOverflow.ellipsis, 'Hello $name, how are you?')
  ));
}

//remaining to run