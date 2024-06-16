import 'package:coffee_ui/widgets/texts.dart';
import 'package:coffee_ui/widgets/coffee_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BuyingCoffeePage extends StatelessWidget {
  const BuyingCoffeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SizedBox(
            height: 440,
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://pikwizard.com/pw/small/1d30f5049f5eac3ec4f76efc01f7b529.jpg'),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 450,
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 136, 75, 52),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Texts(
                    left: 40,
                    top: 8.0,
                    text: 'Espresso Brown Coffee',
                    font: 30,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                    child: Texts(
                      left: 40,
                      text: 'Complex, yet smooth flavor made to order',
                      colors: Color.fromARGB(255, 224, 216, 216),
                      font: 15,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(40.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                          child: Text(
                            '4.5',
                            style:
                                TextStyle(color: Colors.yellow, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                          child: Texts(
                            text: '(10k)',
                            font: 20,
                            colors: Color.fromARGB(255, 224, 216, 216),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(40.0, 20.0, 0.0, 0.0),
                    child: Texts(
                      text: 'Size',
                      font: 18,
                      colors: Color.fromARGB(255, 224, 216, 216),
                    ),
                  ),
                  const Row(
                    children: [
                      CoffeePrice(
                        coffeePrice: '250',
                      ),
                      CoffeePrice(
                        coffeePrice: '350',
                        containerLeft: 5.0,
                      ),
                      CoffeePrice(
                        coffeePrice: '450',
                        containerLeft: 5.0,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40.0, 10.0, 0.0, 0.0),
                    child: Row(
                      children: [
                        Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: const Center(
                              child: Text(
                                '-',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          '1',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: const Center(
                              child: Text(
                                '+',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                        const SizedBox(
                          width: 170,
                        ),
                        const Text(
                          '\$5.99',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40.0, 30.0, 0.0, 0.0),
                    child: Container(
                      width: 350,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const Center(
                        child: Text(
                          'Add to Order',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
