import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/modules/auth/bloc/auth_bloc.dart';
import 'package:jkb_firebase_chat/modules/auth/widget/text_field_form_widgets.dart';
import 'package:jkb_firebase_chat/shared/full_screen_loader.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return FullScreenLoader(
          isLoading: state.isLoading,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Login'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextFieldFormWidget(
                    nameController: nameController,
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            AuthEventLogin(
                              emailAddress: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                    },
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            AuthEventCreateAccount(
                              emailAddress: emailController.text,
                              password: passwordController.text,
                              name: nameController.text,
                            ),
                          );
                    },
                    child: const Text('Create Account'),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
