import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_bloc_example/theme/bloc/theme_bloc.dart';
import 'package:timer_bloc_example/theme/bloc/theme_event.dart';
import 'package:timer_bloc_example/theme/bloc/theme_state.dart';

const List<Color> colors = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.pink,
  Colors.white,
  Colors.black,
  Colors.orange,
];

class ThemeColorWidget extends StatelessWidget {
  const ThemeColorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: colors.map((color) {
            final isSelected = color == state.selectedColor;
            return IconButton(
              onPressed: () {
                context.read<ThemeBloc>().add(ThemeEventSelectedMode(color));
              },
              icon: Icon(
                isSelected ? Icons.check_circle : Icons.circle,
                color: color,
                size: isSelected ? 30 : 20, 
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
