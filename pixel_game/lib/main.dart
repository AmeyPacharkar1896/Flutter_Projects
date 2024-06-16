import 'package:flutter/material.dart';
import 'package:pixel_game/pixel_art_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const PixelArtScreen(),
    ),
  );
}