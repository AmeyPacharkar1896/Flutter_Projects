import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/modules/home/view/home_screen.dart';
import 'package:jkb_firebase_chat/modules/search_user/bloc/search_user_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchUserBloc(),
      child: HomeScreen(),
    );
  }
}
