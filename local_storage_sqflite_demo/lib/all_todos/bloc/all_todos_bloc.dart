import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_storage_sqflite_demo/all_todos/bloc/all_todos_event.dart';
import 'package:local_storage_sqflite_demo/all_todos/bloc/all_todos_state.dart';
import 'package:local_storage_sqflite_demo/core/todo_local_data_base.dart';

class AllTodoBloc extends Bloc<AllTodoEvent, AllTodoState> {
  AllTodoBloc() : super(const AllTodoState(todos: [], isLoading: false)) {
    on<AllTodoEventFetch>(_onAllTodoEventFetch);
    on<AllTodoEventCompleteNotUncomplete>(_onAllTodoEventCompleteNotUncomplete);
  }

  FutureOr<void> _onAllTodoEventFetch(
    AllTodoEventFetch event,
    Emitter<AllTodoState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true),
    );
    final todos = await TodoLocalDatabase.instance.getAll(
      todoFilterType: event.todoFilterType,
      query: event.query,
    );
    emit(
      state.copyWith(
        todos: todos,
        isLoading: false,
        todoFilterType: event.todoFilterType,
        query: event.query,
      ),
    );
  }

  FutureOr<void> _onAllTodoEventCompleteNotUncomplete(
    AllTodoEventCompleteNotUncomplete event,
    Emitter<AllTodoState> emit,
  ) async {
    final todoModel = event.todoModel.copyWith(
      isCompleted: !event.todoModel.isCompleted,
      completedAt: DateTime.now(),
    );
    await TodoLocalDatabase.instance.update(todoModel);
    add(
      AllTodoEventFetch(
        todoFilterType: state.todoFilterType,
        query: state.query,
      ),
    );
  }
}