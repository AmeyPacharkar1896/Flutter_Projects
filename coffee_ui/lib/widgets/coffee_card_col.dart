import 'package:coffee_ui/widgets/texts.dart';
import 'package:flutter/material.dart';

class CoffeeCardCol extends StatelessWidget {
  const CoffeeCardCol(
      {super.key,
      required this.imageURL,
      required this.coffeeName,
      required this.coffeeFlavor,
      required this.coffeePrice});

  final String imageURL;
  final String coffeeName, coffeeFlavor, coffeePrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          height: 370,
          width: 260,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: const Color.fromARGB(255, 106, 67, 53),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image(
                  fit: BoxFit.fill,
                  alignment: Alignment.topCenter,
                  image: NetworkImage(imageURL),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.00, 0.0, 0.0, 0.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Texts(
                      left: 0.0,
                      top: 15.0,
                      right: 0.0,
                      bottom: 0.0,
                      font: 30,
                      text: coffeeName,
                      colors: Colors.white),
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.00, 0.0, 0.0, 0.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Texts(
                              left: 0.0,
                              top: 0.0,
                              right: 0.0,
                              bottom: 0.0,
                              font: 13,
                              text: coffeeFlavor,
                              colors:
                                  const Color.fromARGB(255, 207, 195, 195)),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.00, 0.0, 0.0, 0.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Texts(
                              left: 0.0,
                              top: 0.0,
                              right: 0.0,
                              bottom: 0.0,
                              font: 20,
                              text: coffeePrice,
                              colors: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 90,
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.brown,
                    ),
                      child: const Icon(
                    Icons.shop_2_rounded,
                    size: 27,
                    color: Colors.white,
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
