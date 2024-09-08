import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/modules/home/bloc/home_screen_bloc.dart';
import 'package:jkb_firebase_chat/modules/home/view/home_screen.dart';
import 'package:jkb_firebase_chat/modules/recent_chats/bloc/recent_chats_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeScreenBloc(),
        ),
        BlocProvider(
          create: (_) => RecentChatsBloc(),
        ),
      ],
      child: const HomeScreen(),
    );
  }
}
