import 'dart:async';
import 'dart:developer';

import 'package:local_storage_sqflite_demo/all_todos/model/todo_filter_type.dart';
import 'package:local_storage_sqflite_demo/core/local_data_base.dart';
import 'package:local_storage_sqflite_demo/model/todo_model.dart';


const tableName = 'Todos';

class TodoLocalDatabase {
  TodoLocalDatabase._();
  static final instance = TodoLocalDatabase._();
  final _localDatabase = LocalDatabase();

  Future<List<TodoModel>> getAll({
    TodoFilterType todoFilterType = TodoFilterType.all,
    String query = '',
  }) async {
    log('todoFilterType : $todoFilterType');
    final response = await _localDatabase.database.query(
      tableName,
      columns: [
        'id',
        'title',
        'description',
        'isCompleted',
        'deletedAt',
        'createdAt',
        'updatedAt',
        'completedAt',
      ],
      where: _getWhere(todoFilterType, query),
      whereArgs: _getWhereArgs(todoFilterType, query),
    );
    return response.map((map) => TodoModel.fromMap(map)).toList();
  }

  String? _getWhere(TodoFilterType todoFilterType, String query) {
    if (query.isNotEmpty) return 'title LIKE ?';
    return todoFilterType == TodoFilterType.all ? null : 'isCompleted = ?';
  }

  List<Object?>? _getWhereArgs(TodoFilterType todoFilterType, String query) {
    if (query.isNotEmpty) return ['%$query%'];
    return todoFilterType == TodoFilterType.all
        ? null
        : [todoFilterType == TodoFilterType.completed ? 1 : 0];
  }

  String _getAllSqlQuery(
    TodoFilterType todoFilterType,
    String query,
  ) {
    if (query.isNotEmpty) {
      return 'SELECT * FROM $tableName WHERE title LIKE ?';
    }
    return 'SELECT * FROM $tableName WHERE isCompleted = ?';
  }

  Future<TodoModel?> get(int id) async { //132
    final response = await _localDatabase.database.query(
      tableName,
      columns: [
        'id',
        'title',
        'description',
        'isCompleted',
        'deletedAt',
        'createdAt',
        'updatedAt',
        'completedAt',
      ],
      where: 'id = ?',
      whereArgs: [id], //132
    );
    return response.firstOrNull != null
        ? TodoModel.fromMap(response.first)
        : null;
  }

  Future<TodoModel?> add(TodoModel todoModel) async {
    final id = await _localDatabase.database.insert(
      tableName,
      todoModel.toMap(),
    );
    final todo = todoModel.copyWith(id: id);
    return todo;
  }

  Future<void> update(TodoModel todoModel) async {
    if (todoModel.id == null) return;
    await _localDatabase.database.update(
      tableName,
      todoModel.toMap(),
      where: 'id = ?',
      whereArgs: [todoModel.id],
    );
  }

  Future<void> delete(TodoModel todoModel) async {
    await _localDatabase.database.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [todoModel.id],
    );
  }
}