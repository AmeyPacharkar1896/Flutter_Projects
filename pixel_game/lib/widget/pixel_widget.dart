import 'package:flutter/material.dart';

class PixelWidget extends StatelessWidget {
  const PixelWidget({super.key, required this.onTap, required this.index, this.color});
  
  final int index;
  final Color? color;
  final void Function() onTap;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap.call();
      },
      child: Ink(
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            width: 0.4,
            color: Colors.white10,
          )
        ),
      ),
    );
  }
}
