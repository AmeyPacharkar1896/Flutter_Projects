import 'package:flutter/material.dart';

class CoffeePrice extends StatelessWidget {
  const CoffeePrice({super.key, this.containerLeft = 35.0, required this.coffeePrice});

  final double containerLeft;
  final String coffeePrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(containerLeft, 5.0, 0.0, 0.0),
      child: Container(
        height: 60,
        width: 120,
        decoration: BoxDecoration(
          color: Colors.brown,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
          child: Row(
            children: [
              const Icon(Icons.coffee),
              Text(coffeePrice),
            ],
          ),
        ),
      ),
    );
  }
}
