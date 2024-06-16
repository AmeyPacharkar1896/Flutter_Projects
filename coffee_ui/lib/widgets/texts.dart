import 'package:flutter/material.dart';

class Texts extends StatelessWidget {
  const Texts({
    super.key,
     this.left = 0.0,
     this.top = 0.0,
     this.right = 0.0,
     this.bottom = 0.0,
     this.font = 10.0,
    required this.text,
     this.colors = Colors.white,
  });

  final double left, top, right, bottom, font;
  final String text;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: Text(
        text,
        style: TextStyle(
          color: colors,
          fontSize: font,
        ),
      ),
    );
  }
}
