import 'dart:ui';

abstract class ThemeEvent {}

class ThemeEventDarkMode extends ThemeEvent {}

class ThemeEventLightMode extends ThemeEvent {}

class ThemeEventSelectedMode extends ThemeEvent {
  ThemeEventSelectedMode(this.selectedColor);
  
  final Color selectedColor;

  List<Object> get props => [selectedColor];
}