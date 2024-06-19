import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_bloc_example/theme/bloc/theme_bloc.dart';
import 'package:timer_bloc_example/theme/bloc/theme_state.dart';
import 'package:timer_bloc_example/timer/view/screen/timer_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        final brightness = themeState.isDarkMode ? Brightness.dark : Brightness.light;
        final colorScheme = ColorScheme.fromSeed(
          seedColor: themeState.selectedColor,
          brightness: brightness,
        );

        return MaterialApp(
          theme: ThemeData(
            brightness: brightness,
            colorScheme: colorScheme,
            useMaterial3: true, 
          ),
          home: const TimerScreen(),
        );
      },
    );
  }
}
