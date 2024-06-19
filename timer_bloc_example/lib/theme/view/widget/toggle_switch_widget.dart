import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_bloc_example/theme/bloc/theme_bloc.dart';
import 'package:timer_bloc_example/theme/bloc/theme_event.dart';
import 'package:timer_bloc_example/theme/bloc/theme_state.dart';

class ToggleSwitchWidget extends StatelessWidget {
  const ToggleSwitchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Switch mode',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        BlocBuilder<ThemeBloc, ThemeState>(builder: (context, ThemeState) {
          return Switch(
            value: ThemeState.isDarkMode,
            onChanged: (value) {
              value
                  ? context.read<ThemeBloc>().add(
                        ThemeEventDarkMode(ThemeState.selectedColor),
                      )
                  : context.read<ThemeBloc>().add(
                        ThemeEventLightMode(ThemeState.selectedColor),
                      );
            },
          );
        }),
      ],
    );
  }
}
