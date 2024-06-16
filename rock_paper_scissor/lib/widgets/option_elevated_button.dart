import 'package:flutter/material.dart';

class OptionElevatedButton extends StatelessWidget {
  const OptionElevatedButton({
    super.key,
    required this.onTap, required this.text,
  });

  final void Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () {
            onTap.call();
          },
          child: Text(text)),
    );
  }
}
