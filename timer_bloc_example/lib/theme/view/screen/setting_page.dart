import 'package:flutter/material.dart';
import 'package:timer_bloc_example/theme/view/widget/theme_color_widget.dart';
import 'package:timer_bloc_example/theme/view/widget/toggle_switch_widget.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Setting Page',
        ),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ToggleSwitchWidget(),
          ThemeColorWidget(),
        ],
      ),
    );
  }
}
