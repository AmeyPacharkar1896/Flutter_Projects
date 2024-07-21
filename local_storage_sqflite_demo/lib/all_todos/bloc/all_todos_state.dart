part of 'package:local_storage_sqflite_demo/all_todos/bloc/all_todos_bloc.dart';

abstract class AllTodoState {}

class AllTodoInitialState extends AllTodoState {}

class AllToDoLoadingState extends AllTodoState {}

class AllTodoLoadedState extends AllTodoState {
  AllTodoLoadedState({
    required this.todos,
  });

  final List<TodoModel> todos;
}