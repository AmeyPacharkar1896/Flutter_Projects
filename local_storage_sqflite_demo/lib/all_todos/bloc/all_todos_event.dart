part of 'package:local_storage_sqflite_demo/all_todos/bloc/all_todos_bloc.dart';

abstract class AllTodoEvent {
  const AllTodoEvent();
}

class AllTodoEventFetch extends AllTodoEvent {
  const AllTodoEventFetch();
}