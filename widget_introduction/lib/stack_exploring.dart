import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class StackWidget extends StatelessWidget {
  const StackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
            children: [
              Container(
                height: 300,
                width: 300,
                color: Colors.red,
              ),
              Container(
                height: 200,
                width: 200,
                color: Colors.blue,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.green,
              ),
            ],
          ),
      ),
    );
  }
}