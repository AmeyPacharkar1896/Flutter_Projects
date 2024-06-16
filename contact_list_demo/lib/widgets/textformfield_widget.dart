import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldFormWidget extends StatefulWidget {
  TextFieldFormWidget({super.key, required this.userController, this.label, this.hint, this.Validate});

  TextEditingController userController = TextEditingController();
  late String? label, hint;
  String? Function(String?)? Validate;
  @override
  State<TextFieldFormWidget> createState() => _TextFieldFormWidgetState();
}

class _TextFieldFormWidgetState extends State<TextFieldFormWidget> {
  
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: widget.userController,
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hint,
        ),
        // keyboardType: TextInputType.name,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.Validate,
      ),
    );
  }
}
