import 'package:coffee_ui/widgets/coffee_card_col.dart';
import 'package:coffee_ui/widgets/coffee_card_row.dart';
import 'package:coffee_ui/widgets/texts.dart';
import 'package:flutter/material.dart';

class UserFirstPage extends StatelessWidget {
  const UserFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: const Row(
            children: [
              Icon(
                Icons.menu,
                size: 30,
                color: Colors.white,
              ),
              SizedBox(
                width: 40,
              ),
              Center(
                child: Text('Hello, Amey Pacharkar',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
              SizedBox(
                width: 25,
              ),
              Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: 900,
            decoration: const BoxDecoration(
              color: Colors.brown,
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    const Row(children: [
                      Texts(
                          left: 20.0,
                          top: 0.0,
                          right: 0.0,
                          bottom: 0.0,
                          font: 19.0,
                          text: 'Coffee',
                          colors: Color.fromARGB(255, 106, 67, 53)),
                      Texts(
                          left: 42.0,
                          top: 0.0,
                          right: 0.0,
                          bottom: 0.0,
                          font: 19.0,
                          text: 'Tea',
                          colors: Colors.white),
                      Texts(
                          left: 42.0,
                          top: 0.0,
                          right: 0.0,
                          bottom: 0.0,
                          font: 19.0,
                          text: 'Juices',
                          colors: Colors.white),
                      Texts(
                          left: 42.0,
                          top: 0.0,
                          right: 0.0,
                          bottom: 0.0,
                          font: 19.0,
                          text: 'Cake',
                          colors: Colors.white),
                    ]),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Container(
                              height: 3,
                              width: 62,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 106, 67, 53),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Column(
                  children: [
                    SizedBox(
                      width: 900,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            CoffeeCardCol(
                                imageURL:
                                    'https://blogstudio.s3.theshoppad.net/coffeeheroau/ec178d83e5f597b162cda1e60cb64194.jpg',
                                coffeeName: 'Espresso\nBrown Coffee',
                                coffeeFlavor: 'Complex flavor',
                                coffeePrice: '₹5.99'),
                            CoffeeCardCol(
                                imageURL:
                                    'https://www.allrecipes.com/thmb/Hqro0FNdnDEwDjrEoxhMfKdWfOY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/21667-easy-iced-coffee-ddmfs-4x3-0093-7becf3932bd64ed7b594d46c02d0889f.jpg',
                                coffeeName: 'Iced Coffee\nWith Milk',
                                coffeeFlavor: 'Complex flavor',
                                coffeePrice: '₹7.99'),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Texts(
                                left: 20.0,
                                top: 0.0,
                                right: 0.0,
                                bottom: 0.0,
                                font: 30.0,
                                text: 'Popular',
                                colors: Colors.white),
                            Texts(
                                left: 180.0,
                                top: 0.0,
                                right: 0.0,
                                bottom: 0.0,
                                font: 15.0,
                                text: 'View all',
                                colors: Colors.white),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        CoffeeCardRow(
                            imageURL:
                                'https://beanground.b-cdn.net/wp-content/uploads/2018/04/What-Is-An-Americano-Coffee-1000x550-px.png',
                            coffeName: 'Americano',
                            coffeeDiscription: 'Simplicity Itself',
                            coffeePrice: '₹3.99'),
                      ],
                    ),
                    Row(
                      children: [
                        CoffeeCardRow(
                            imageURL:
                                'https://images-gmi-pmc.edge-generalmills.com/440b6410-e6ff-4c52-ac8a-7984f2ec91ab.jpg',
                            coffeName: 'Macchiato',
                            coffeeDiscription: '2Shot of Espresso',
                            coffeePrice: '₹4.99'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
