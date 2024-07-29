import 'package:flutter/material.dart';
import 'package:shared_preference_demo/widget/custom_text_widget.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String labelString;
  final String hintString;

  const CustomTextFormFieldWidget({
    required this.controller,
    required this.icon,
    required this.labelString,
    required this.hintString,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.blue,
          ),
          label: CustomTextWidget(string: labelString),
          hintText: hintString,
        ),
      ),
    );
  }
}
