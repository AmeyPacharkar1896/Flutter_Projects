import 'package:flutter/material.dart';
import 'package:navigation_tutorial/routing/argument_passing.dart';
import 'package:navigation_tutorial/screens/first_screen.dart';
import 'package:navigation_tutorial/screens/second_screen.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    
    final args = settings.arguments;
    switch(settings.name) {
      case '/' :
      return MaterialPageRoute(builder: (context) => const FirstScreen());
      case '/secondScreen' :
      if (args is ArgumentPassing) {
        return MaterialPageRoute(builder: (BuildContext context) {
          ArgumentPassing argument = args;
          return SecondScreen(username: argument.username, password: argument.password,
          );
        });
      } else {
        return _errorRoute();
      }
      default :
      return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: ((context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(child: Text('Error'),),
      );
    })
    );
  }
}