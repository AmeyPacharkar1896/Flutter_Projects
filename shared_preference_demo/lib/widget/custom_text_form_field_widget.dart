import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget({
    super.key,
    required this.controller,
    this.icon,
    this.labelString,
    this.hintString,
  });

  final TextEditingController controller;
  final IconData? icon;
  final String? labelString;
  final String? hintString;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(icon),
          labelText: labelString,
          hintText: hintString,
          hoverColor: Colors.grey,
        ),
      ),
    );
  }
}
