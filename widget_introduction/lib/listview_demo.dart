
// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:widget_introduction/call.dart';

final List<int> numberList = List.generate(100, (index) => index);

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Demo'),),
      // body: ListView(
      //   padding: EdgeInsets.all(10.0),
      //   reverse: true,
      //   children: numberList.map((number){
      //     return Call(input: number.toString());
      //   }).toList(),
      // ),
      body: ListView.builder(itemBuilder: (context, index) {
        // print('build ${numberList[index].toString()}');
        return ListTile(
          title: Text(numberList[index].toString()),
          leading: const Icon(Icons.numbers),
        );
      }),
    );
  }
}