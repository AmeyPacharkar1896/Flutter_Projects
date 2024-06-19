import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_bloc_example/theme/bloc/theme_event.dart';
import 'package:timer_bloc_example/theme/bloc/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(isDarkMode: false)) {
    on<ThemeEventDarkMode>(_onThemeDarkMode);
    on<ThemeEventLightMode>(_onThemeLightMode);
    on<ThemeEventSelectedMode>(_onThemeSelectedMode);
  }

  FutureOr<void> _onThemeDarkMode(
    ThemeEventDarkMode event,
    Emitter<ThemeState> emit,
  ) {
    emit(ThemeState(
      isDarkMode: true,
      selectedColor: event.selectedColor,
    ));
  }

  FutureOr<void> _onThemeLightMode(
    ThemeEventLightMode event,
    Emitter<ThemeState> emit,
  ) {
    emit(ThemeState(
      isDarkMode: false,
      selectedColor: event.selectedColor,
    ));
  }

  FutureOr<void> _onThemeSelectedMode(
    ThemeEventSelectedMode event,
    Emitter<ThemeState> emit,
  ) {
    emit(ThemeState(
      isDarkMode: state.isDarkMode,
      selectedColor: event.selectedColor,
    ));
  }
}
