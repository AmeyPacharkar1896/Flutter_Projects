import 'package:flutter/material.dart';

//crt + .import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      
      body: Center(
        
        child: Text(
            'Hello World',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Colors.amber,
              fontSize: 100,
              fontWeight: FontWeight.w200,
              wordSpacing: 20,
              letterSpacing: 10,
              backgroundColor: Colors.blue,
              shadows: [
                Shadow(
                  color: Colors.black,
                  blurRadius: 100,
                  offset: Offset(10, 10),
                )
              ],
              decoration: TextDecoration.underline,
            ),
          ),
      ),
    ),
  ));
}
//container, row ==> horizontal stack, column ==> vertical stack, center, 