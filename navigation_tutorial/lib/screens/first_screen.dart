import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:navigation_tutorial/routing/argument_passing.dart';
import 'package:navigation_tutorial/widgets/text_forms.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  // late String message;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Stack(
        children: [
          Positioned(
            right: 30,
            bottom: 30,
            child: FloatingActionButton(onPressed: () {
                  userNameController.text = '';
                  passwordController.text = '';
                },
                child: Text('Clear'),),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    TextForms(
                        controller: userNameController,
                        labels: 'UserName',
                        hint: 'Enter your name',
                        validate: (String? value) {
                          if (value == null) return 'Enter username';
                          if (value.isEmpty) return 'Enter username';
                          return null;
                        }),
                    TextForms(
                        controller: passwordController,
                        labels: 'Password',
                        hint: 'Enter your password',
                        obscuretext: true,
                        validate: (String? value) {
                          if (value == null) return 'Enter username';
                          if (value.isEmpty) return 'Enter username';
                          if (value.length < 8) return 'Atleast 8 characters';
                          return null;
                        }),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/secondScreen",
                        arguments: ArgumentPassing(userNameController.text, passwordController.text));
                  },
                  child: const Text('Go to next page')),
          
              
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    passwordController.dispose();
  }
}
