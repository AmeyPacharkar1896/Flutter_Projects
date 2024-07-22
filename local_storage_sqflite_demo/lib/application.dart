import 'package:flutter/material.dart';
import 'package:local_storage_sqflite_demo/home/home_screen.dart';
import 'global_provider.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalProvider(
      child: MaterialApp(
        scaffoldMessengerKey: scaffoldMessengerKey,
        theme: ThemeData.dark(
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}