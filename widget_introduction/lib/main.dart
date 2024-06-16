import 'package:flutter/material.dart';
import 'package:widget_introduction/listview_demo.dart';

void main() {
  runApp(const MyApplication());
}

class MyApplication extends StatelessWidget{
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListViewDemo(),
    );
  }
}
