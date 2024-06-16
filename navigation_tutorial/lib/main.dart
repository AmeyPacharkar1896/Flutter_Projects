import 'package:flutter/material.dart';
import 'package:navigation_tutorial/routing/route_generator.dart';

void main() {
  runApp(
    const MaterialApp(
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    )
  );
}
