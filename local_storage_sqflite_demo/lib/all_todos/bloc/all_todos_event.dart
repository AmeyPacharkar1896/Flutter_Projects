import 'package:local_storage_sqflite_demo/all_todos/model/todo_filter_type.dart';
import 'package:local_storage_sqflite_demo/model/todo_model.dart';

abstract class AllTodoEvent {
  const AllTodoEvent();
}

class AllTodoEventFetch extends AllTodoEvent {
  const AllTodoEventFetch({
    this.todoFilterType = TodoFilterType.all,
    this.query = '',
  });

  final TodoFilterType todoFilterType;
  final String query;
}

class AllTodoEventCompleteNotUncomplete extends AllTodoEvent {
  const AllTodoEventCompleteNotUncomplete({
    required this.todoModel,
  });

  final TodoModel todoModel;
}