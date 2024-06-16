import 'package:flutter/material.dart';

class ColorInPallete extends StatelessWidget {
  const ColorInPallete({super.key, required this.onTap, required this.isSelected, required this.color});

  final Color color;
  final void Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap.call();
      },
      child: Ink(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            width: isSelected ? 2 : 1,
            color: isSelected ? Colors.white : Colors.white10,
          ),
        ),
      ),
    );
  }
}
