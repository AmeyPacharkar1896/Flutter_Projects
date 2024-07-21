import 'package:flutter/material.dart';
import 'package:local_storage_sqflite_demo/all_todos/view/all_todos_screen.dart';
import 'package:local_storage_sqflite_demo/core/local_data_base.dart';
import 'package:local_storage_sqflite_demo/global_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocalDataBase().initialize;
  runApp(
    const GlobalProvider(
      child: MaterialApp(
        home: AllTodoScreen(),
      ),
    )
  );
}