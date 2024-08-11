import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/modules/search_user/bloc/search_user_bloc.dart';
import 'package:jkb_firebase_chat/modules/search_user/view/search_screen.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchUserBloc(),
      child: const SearchScreen(),
    );
  }
}
