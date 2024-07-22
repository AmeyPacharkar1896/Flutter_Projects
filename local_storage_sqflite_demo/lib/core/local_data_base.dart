import 'dart:developer';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  LocalDatabase._internal();
  factory LocalDatabase() {
    return _singleton;
  }
  static final LocalDatabase _singleton = LocalDatabase._internal();

  static const tableName = 'Todos';

  late final Database database;

  Future<void> initialize() async {
    final localStoragePath = await getDatabasesPath();
    final databasePath = '$localStoragePath/todo_database.db';

    database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, description TEXT, isCompleted INTEGER NOT NULL, deletedAt INTEGER, createdAt INTEGER NOT NULL, updatedAt INTEGER, completedAt INTEGER)',
        );
        log('database created!');
      },
    );
  }
}
