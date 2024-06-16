import 'package:flutter/material.dart';

// ignore: must_be_immutable
class YesOrNo extends StatelessWidget {
  YesOrNo({super.key, required this.onTap, required this.text, this.left = 10.0});
  late void Function() onTap;
  late String text;
  late double left;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, 10.0, 0.0, 0.0),
      child: ElevatedButton(
          onPressed: () {
            onTap.call();
          },
          child: Text(text)),
    );
  }
}
