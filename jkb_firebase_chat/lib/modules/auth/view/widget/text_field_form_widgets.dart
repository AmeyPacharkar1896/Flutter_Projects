import 'package:flutter/material.dart';

class TextFieldFormWidget extends StatelessWidget {
  const TextFieldFormWidget({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(
            hintText: 'Enter name',
          ),
        ),
        TextFormField(
          controller: emailController,
          decoration: const InputDecoration(
            hintText: 'Enter email address',
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: passwordController,
          obscureText: true,
          obscuringCharacter: '*',
          decoration: const InputDecoration(
            hintText: 'Enter password',
          ),
        ),
      ],
    );
  }
}
