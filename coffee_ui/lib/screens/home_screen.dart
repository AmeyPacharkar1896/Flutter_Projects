import 'package:coffee_ui/widgets/texts.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 900,
        decoration: const BoxDecoration(
          color: Colors.brown,
        ),
        child: Stack(
          children: [
            const Image(
              image: NetworkImage(
                  'https://as1.ftcdn.net/v2/jpg/02/48/25/10/1000_F_248251015_BLFk9fNlMgqFuTsDDNeL4X8riITCpU9q.jpg'),
            ),
            Positioned(
              child: Container(
                width: double.maxFinite,
                height: 700,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.brown,
                      Colors.transparent,
                      Colors.brown,
                    ])),
              ),
            ),
            const Texts(
              left: 30.0,
              top: 40.0,
              right: 0.0,
              bottom: 0.0,
              font: 40.0,
              text: ' Amazing\n taste of\n Coffee',
              colors: Color.fromARGB(255, 159, 101, 80),
            ),
            const Texts(
              left: 30.0,
              top: 550.0,
              right: 0.0,
              bottom: 0.0,
              font: 19,
              text:
                  'Prepare to tantalize your taste bud\nwith the amazing taste of coffee\nlike before',
              colors: Color.fromARGB(255, 159, 101, 80),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 700.0, 0.0, 0.0),
              child: Row(
                children: [
                  Container(
                    width: 200,
                    height: 70,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 159, 101, 80),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: const Center(
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 120,
                  ),
                  const Text(
                    'skip',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        decoration: TextDecoration.underline),
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
