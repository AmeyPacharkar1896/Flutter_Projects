import 'package:flutter/material.dart';
import 'package:shared_preference_demo/widget/custom_text_form_field_widget.dart';

class CustomTextFormFieldBuilder extends StatelessWidget {
  final TextEditingController userNameController;
  final TextEditingController ageController;
  final VoidCallback onSave;

  const CustomTextFormFieldBuilder({
    required this.userNameController,
    required this.ageController,
    required this.onSave,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormFieldWidget(
          controller: userNameController,
          icon: Icons.person,
          labelString: 'Username',
          hintString: 'Enter your username',
        ),
        CustomTextFormFieldWidget(
          controller: ageController,
          icon: Icons.calendar_month_rounded,
          labelString: 'Age*',
          hintString: 'Enter your age',
        ),
        ElevatedButton(
          onPressed: onSave,
          child: const Text('Save'),
        ),
      ],
    );
  }
}
