import 'dart:ui';

abstract class ThemeEvent {}

class ThemeEventDarkMode extends ThemeEvent {
  ThemeEventDarkMode(this.selectedColor);

  final Color selectedColor;

  List<Object> get props => [selectedColor];
}

class ThemeEventLightMode extends ThemeEvent {
  ThemeEventLightMode(this.selectedColor);

  final Color selectedColor;

  List<Object> get props => [selectedColor];
}

class ThemeEventSelectedMode extends ThemeEvent {
  ThemeEventSelectedMode(this.selectedColor);

  final Color selectedColor;

  List<Object> get props => [selectedColor];
}
