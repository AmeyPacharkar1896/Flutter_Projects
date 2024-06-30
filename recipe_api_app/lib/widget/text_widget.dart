import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    this.fontWeight,
    this.fontSizeText = 25,
  });

  final String text;
  final FontWeight? fontWeight;
  final double fontSizeText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSizeText,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
