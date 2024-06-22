import 'package:flutter/material.dart';
import 'package:user_data_api/service/user_api_service.dart';
import 'package:user_data_api/view/user_page.dart';

void main() {
  UserApiService userApiService = UserApiService();
  userApiService.getAllUsers();

  runApp(
    const MaterialApp(
      home: UserPage(),
    )
  );
}