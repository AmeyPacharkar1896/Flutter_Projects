import 'package:flutter/material.dart';

void main() {
  runApp(const Row(
    children: <Widget>[

      Expanded(child: Text('Hello I am doing Dart',
      textDirection: TextDirection.ltr,
      style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w200,
              wordSpacing: 10,
              backgroundColor: Colors.blue,
            ),
          ),
        ),
      
      Expanded(child: Text('This is its logo',
      textDirection: TextDirection.ltr,
      style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w200,
              wordSpacing:10,
              backgroundColor: Colors.blue,
            ),
          ),
        ),
      
      Expanded(
        child: FittedBox(
          child: FlutterLogo(),
        ),
      ),
    ],
  )
    );
}