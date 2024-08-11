import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/email_and_password/bloc/auth_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          FilledButton(
            onPressed: () {
              context.read<AuthBloc>().add(
                    AuthEventLogout(),
                  );
            },
            child: const Text('LogOut'),
          ),
        ],
      ),
      
    );
  }
}
