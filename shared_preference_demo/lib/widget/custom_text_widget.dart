
import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.string,
  });

  final String string;

  @override
  Widget build(BuildContext context) {
    return Text(
      string,
      style: TextStyle(
        color: Colors.blue,
      ),
    );
  }
}
