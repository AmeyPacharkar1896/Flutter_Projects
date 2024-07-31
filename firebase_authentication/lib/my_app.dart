import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/services/auth_state_provider.dart';
import 'package:firebase_authentication/view/authentication_screen/authentication_screen.dart';
import 'package:firebase_authentication/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final AuthStateProvider _authStateProvider = AuthStateProvider();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: _authStateProvider.user,
      builder: ((context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        else if (snapshot.hasData) {
          return const HomeScreen();
        }
        else {
          return AuthicationScreen();
        }
      }),
    );
  }
}
