import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextForms extends StatefulWidget {
  TextForms(
      {super.key,
      required this.controller,
      required this.labels,
      required this.hint,
      required this.validate,
      this.obscuretext = false});
  late TextEditingController controller;
  late String labels, hint;
  late Function(String)? validate;
  late bool obscuretext;

  @override
  State<TextForms> createState() => _TextFormsState();
}

class _TextFormsState extends State<TextForms> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 400,
        child: TextFormField(
          controller: widget.controller,
          obscureText: widget.obscuretext,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            label: Text(widget.labels),
            hintText: widget.hint,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.validate as String? Function(String?)?,
        ),
      ),
    );
  }
}
