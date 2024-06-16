import 'package:flutter/material.dart';
import 'package:navigation_tutorial/widgets/yes_or_no.dart';

// ignore: must_be_immutable
class SecondScreen extends StatefulWidget {
  SecondScreen({super.key, required this.username, required this.password});
  late String username, password;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String message = 'Do you wish to see your password?';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
              child: Text('The message received from first screen is ')),
          Text('Username : ${widget.username}'),
          Text(message),
          Row(
            children: [
              YesOrNo(
                  onTap: () {
                    setState(() {
                      message = 'Your password is : ${widget.password}';
                    });
                  },
                  left: 130,
                  text: 'YES'),
              YesOrNo(
                  onTap: () {
                    setState(() {
                      message = 'I wont show you the password then';
                    });
                  },
                  text: 'NO'),
            ],
          ),
        ],
      ),
    );
  }
}
