import 'dart:developer';

import 'package:sqflite/sqflite.dart';

class LocalDataBase {
  LocalDataBase._internal();
  factory LocalDataBase() {
    return _singleton;
  }
  static final LocalDataBase _singleton = LocalDataBase._internal();

  static const tableName = 'Todos';

  late final Database database;

  Future<void> initialize() async {
    final localStoragePath = await getDatabasesPath();
    final dataBasePath = '$localStoragePath/todo_database.db';

    database = await openDatabase(
      dataBasePath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, description TEXT, isCompleted INTEGER NOT NULL, deletedAt INTEGER, createdAt INTEGER NOT NULL, updatedAt INTEGER, completedAt INTEGER)',
        );
        log('Database created');
      },
    );
  }
}
