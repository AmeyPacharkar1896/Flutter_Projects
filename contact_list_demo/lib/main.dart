import 'package:contact_list_demo/screens/contact_list.dart';
import 'package:flutter/material.dart';

final formKey = GlobalKey<FormState>();
final scaffoldMessagerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(
    const MaterialApp(
      home: ContactList(),
    )
  );
}