import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: CounterScreen(),
  ));
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Demo App'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: const CounterScreenBody(counter: 1),
    );
  }
}

class CounterScreenBody extends StatefulWidget {
  const CounterScreenBody({super.key, required this.counter});

  final int counter;

  @override
  State<StatefulWidget> createState() {
    return CounterScreenBodyState();
  }
}

class CounterScreenBodyState extends State<CounterScreenBody> {
  //late determine which variable will get value later
  //just like final
  //part of memory management

  late int counter;
  @override
  void initState() {
    super.initState();
    counter = widget.counter;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            counter.toString(),
            style: const TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                counter--;
              });
            },
            child: const Text(
              'Decrement ',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            )),
        ElevatedButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            child: const Text(
              'Increment ',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            )),
      ],
    );
  }
}
