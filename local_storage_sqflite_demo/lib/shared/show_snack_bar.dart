import 'package:flutter/material.dart';

import '../../application.dart';

void showSnackbar(String message) {
  scaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(content: Text(message)),
  );
}