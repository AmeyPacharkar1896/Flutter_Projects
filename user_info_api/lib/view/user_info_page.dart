import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_data_api/bloc/user_bloc.dart';
import 'package:user_data_api/view/user_info_screen.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoBloc(),
      child: const UserInfoScreen(),
    );
  }
}