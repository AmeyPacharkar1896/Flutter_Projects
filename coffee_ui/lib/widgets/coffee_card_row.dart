import 'package:coffee_ui/widgets/texts.dart';
import 'package:flutter/material.dart';

class CoffeeCardRow extends StatelessWidget {
  const CoffeeCardRow(
      {super.key,
      required this.imageURL,
      required this.coffeName,
      required this.coffeeDiscription,
      required this.coffeePrice});

  final String imageURL;
  final String coffeName, coffeeDiscription, coffeePrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
      child: Container(
        height: 80,
        width: 360,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 106, 67, 53),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
                image: NetworkImage(imageURL),
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Texts(
                        left: 25.0,
                        top: 10.0,
                        right: 0.0,
                        bottom: 0.0,
                        font: 20,
                        text: coffeName,
                        colors: Colors.white),
                    Texts(
                        left: 25.0,
                        top: 5.0,
                        right: 0.0,
                        bottom: 0.0,
                        font: 12,
                        text: coffeeDiscription,
                        colors: Color.fromARGB(255, 207, 195, 195)),
                  ],
                )),
            Texts(
                left: 18.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                font: 20,
                text: coffeePrice,
                colors: Colors.white),
          ],
        ),
      ),
    );
  }
}
