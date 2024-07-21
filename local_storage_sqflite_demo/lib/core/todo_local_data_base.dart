import 'package:local_storage_sqflite_demo/core/local_data_base.dart';
import 'package:local_storage_sqflite_demo/model/todo_model.dart';

const tableName = 'Todos';

class TodoLocalDataBase {
  TodoLocalDataBase._();
  static final instance = TodoLocalDataBase._();
  final _localDatabase = LocalDataBase();

  Future<List<TodoModel>> getAll() async {
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
    );
    return response.map((map) => TodoModel.fromMap(map)).toList();
  }

  Future<TodoModel?> get(int id) async {
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
      whereArgs: [id],
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
