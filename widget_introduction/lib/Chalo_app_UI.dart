// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 120,
          backgroundColor: Colors.yellowAccent,
          title: Column(
            children: [
              Row(children: [
                Container(
                    alignment: Alignment(300, 300),
                    width: 45.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    )),
                Center(
                  widthFactor: 5,
                  heightFactor: 3,
                  child: Text(
                    'Chalo',
                  ),
                )
              ]),
              Center(
                widthFactor: 5,
                child: Container(
                    height: 50,
                    width: 400,
                    alignment: Alignment.center,
                    child: Text('Enter destianaion or bus number'),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        // color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                          )
                        ])),
              ),
            ],
          )),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          //for search bar
          children: [
            //bus or vogo
            Row(
              children: [
                SizedBox(
                  height: 90,
                  width: 35,
                ),
                Container(
                  width: 150,
                  height: 30,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                    )
                  ]),
                  child: Text('CHALO BUS',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15)),
                ),
                SizedBox(
                  height: 90,
                  width: 20,
                ),
                Container(
                  width: 150,
                  height: 30,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                    )
                  ]),
                  child: Text('VOGO',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15)),
                )
              ],
            ),

            //past searches
            Row(
              children: [
                SizedBox(
                  height: 70,
                  width: 35,
                ),
                Container(
                  width: 180,
                  height: 60,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                    )
                  ]),
                  child: Text('473',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20)),
                ),
                SizedBox(
                  height: 70,
                  width: 20,
                ),
                Container(
                  width: 140,
                  height: 60,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                    )
                  ]),
                  child: Text('316',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20)),
                )
              ],
            ),

            Row(children: [
              SizedBox(
                height: 70,
                width: 40,
              ),
              Text('BUY MOBILE TICKET/PASS',
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 20)),
              SizedBox(
                height: 70,
                width: 27,
              ),
              Text('See All',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.orange, fontSize: 17))
            ]),

            //advertisement
            SizedBox(
                width: 340,
                child: Placeholder(
                  fallbackHeight: 200,
                )),

            //bus pass and ticket
            Row(
              children: [
                SizedBox(
                  height: 90,
                  width: 35,
                ),
                Container(
                  width: 150,
                  height: 30,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                    )
                  ]),
                  child: Text('Bus Pass',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15)),
                ),
                SizedBox(
                  height: 90,
                  width: 20,
                ),
                Container(
                  width: 150,
                  height: 30,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                    )
                  ]),
                  child: Text('Pay for Ticket',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15)),
                )
              ],
            ),

            //chalo card
            Row(children: [
              SizedBox(
                height: 70,
                width: 40,
              ),
              Text('YOUR CHALO CARD',
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 20)),
              SizedBox(
                height: 70,
                width: 80,
              ),
              Text('See All',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.orange, fontSize: 17))
            ]),

            //view balance and recharge card
            Row(
              children: [
                SizedBox(
                  height: 60,
                  width: 35,
                ),
                Container(
                  width: 150,
                  height: 30,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                    )
                  ]),
                  child: Text('View Balance',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15)),
                ),
                SizedBox(
                  height: 60,
                  width: 20,
                ),
                Container(
                  width: 150,
                  height: 30,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                    )
                  ]),
                  child: Text('Recharge card',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15)),
                )
              ],
            ),

            //nearest bus stop
            Row(children: [
              SizedBox(
                height: 70,
                width: 40,
              ),
              Text('NEAREST BUS STOP',
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 20)),
              SizedBox(
                height: 70,
                width: 80,
              ),
              Text('See All',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.orange, fontSize: 17))
            ]),

            Container(
              width: 340,
              height: 300,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                )
              ]),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 45,
                    width: 250,
                    child: Text(
                      'Bandra Colony Bus Station',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  SizedBox(
                      width: 300,
                      child: Text(
                        'Next Buses',
                        textAlign: TextAlign.left,
                        style: TextStyle(backgroundColor: Colors.grey),
                      )),
                  //show first bus
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: 300,
                    child: Row(
                      children: [
                        SizedBox(
                          child: Text(
                            '2',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 25.0),
                          ),
                        ),
                        SizedBox(
                          width: 200,
                        ),
                        SizedBox(
                          child: Text(
                            '4min',
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 15.0),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                      width: 300,
                      child: Text(
                        'To Electric House',
                        textAlign: TextAlign.left,
                      )),

                  //show second bus
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: 300,
                    child: Row(
                      children: [
                        SizedBox(
                          child: Text(
                            '11',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 25.0),
                          ),
                        ),
                        SizedBox(
                          width: 200,
                        ),
                        SizedBox(
                          child: Text(
                            '8min',
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 15.0),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                      width: 300,
                      child: Text(
                        'To Navy Nagar Colaba',
                        textAlign: TextAlign.left,
                      )),

                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 250,
                    child: Text(
                      'See all Buses',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.orange,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
