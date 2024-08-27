import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/modules/auth/bloc/auth_bloc.dart';
import 'package:jkb_firebase_chat/modules/setting/view/widget/log_out_button.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log(context.read<AuthBloc>().state.currentUser.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          ),
          const SizedBox(width: 16),
          Text(
            context.read<AuthBloc>().state.currentUser?.name ?? '',
          ),
          const Center(
            child: LogOutButton(),
          )
        ],
      ),
    );
  }
}
