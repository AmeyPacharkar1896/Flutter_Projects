import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_bloc_example/application.dart';
import 'package:timer_bloc_example/theme/bloc/theme_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => ThemeBloc(),
      child: const Application(),
    ),
  );
}