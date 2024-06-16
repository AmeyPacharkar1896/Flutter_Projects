
import 'package:flutter/material.dart';

void main() {
  runApp(Container(
  constraints: const BoxConstraints.expand(
    height: 20,
    width: 20,
  ),
  padding: const EdgeInsets.all(5.0),
  margin: const EdgeInsets.fromLTRB(100, 300, 100, 300), 
  // decoration: const BoxDecoration(
  //   shape: BoxShape.circle,
  // ),
  // margin: const EdgeInsets.all(48.0),
  // padding: const EdgeInsets.all(48.0),
  color: Colors.blue[600],
  alignment: Alignment.center,
  // transform: Matrix4.rotationZ(0.1),
  child: const Text(
            'Hello World',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.w200,
              wordSpacing: 20,
              letterSpacing: 10,
              shadows: [
                Shadow(
                  color: Colors.black,
                  blurRadius: 100,
                  offset: Offset(10, 10),
                )
              ],
            ),
          ),
));
}
