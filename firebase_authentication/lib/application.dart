import 'package:flutter/material.dart';
import 'package:jkb_firebase_chat/global_provider.dart';
import 'package:jkb_firebase_chat/email_and_password/view/auth_guard.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalProvider(
      child: MaterialApp(
        scaffoldMessengerKey: scaffoldMessengerKey,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.indigo,
            // brightness: Brightness.dark,
          ),
        ),
        home: const AuthGuard(),
      ),
    );
  }
}