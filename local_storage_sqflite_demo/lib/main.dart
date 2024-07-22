import 'package:flutter/material.dart';
import 'package:local_storage_sqflite_demo/application.dart';
import 'package:local_storage_sqflite_demo/core/local_data_base.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDatabase().initialize();
  runApp(const Application());
}