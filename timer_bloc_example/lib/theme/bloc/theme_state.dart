import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeState extends Equatable {
  const ThemeState({
    this.selectedColor = Colors.red,
    required this.isDarkMode,
  });

  final bool isDarkMode;
  final Color selectedColor;

  ThemeState copyWith({
    bool? isDarkMode,
    Color? selectedColor,
  }) {
    return ThemeState(
      isDarkMode: this.isDarkMode, 
      selectedColor: this.selectedColor,
    );
  }
  
  @override
  List<Object?> get props => [isDarkMode, selectedColor];
}
