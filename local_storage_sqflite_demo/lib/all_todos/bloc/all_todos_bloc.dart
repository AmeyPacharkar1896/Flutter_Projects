import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_storage_sqflite_demo/core/todo_local_data_base.dart';
import 'package:local_storage_sqflite_demo/model/todo_model.dart';

part 'package:local_storage_sqflite_demo/all_todos/bloc/all_todos_state.dart';
part 'package:local_storage_sqflite_demo/all_todos/bloc/all_todos_event.dart';

class AllTodoBloc extends Bloc<AllTodoEvent, AllTodoState> {
  AllTodoBloc() : super(AllTodoInitialState()) {
    on<AllTodoEventFetch>(_onAllTodoEventFetch);
  }

  FutureOr<void> _onAllTodoEventFetch(
    AllTodoEventFetch event,
    Emitter<AllTodoState> emit,
  ) async {
    final todos = await TodoLocalDataBase.instance.getAll();
    emit(
      AllTodoLoadedState(todos: todos),
    );
  }
}