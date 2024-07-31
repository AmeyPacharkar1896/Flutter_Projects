import 'dart:developer';

import 'package:firebase_authentication/services/auth_service.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthicationScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log-in Page'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email',
            ),
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password',
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    log('Email : ${emailController.text}\nPassword : ${passwordController.text}');
                    await AuthService()
                        .registration(
                          email: emailController.text,
                          password: passwordController.text,
                        )
                        .then(
                          (message) =>
                              ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(message ?? 'Something went wrong'),
                            ),
                          ),
                        );
                  },
                  child: const Text('SignUp')),
                  ElevatedButton(
                  onPressed: () async {
                    log('Email : ${emailController.text}\nPassword : ${passwordController.text}');
                    await AuthService()
                        .login(
                          email: emailController.text,
                          password: passwordController.text,
                        )
                        .then(
                          (message) =>
                              ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(message ?? 'Something went wrong'),
                            ),
                          ),
                        );
                  },
                  child: const Text('Log in')),
            ],
          )
        ],
      ),
    );
  }
}
