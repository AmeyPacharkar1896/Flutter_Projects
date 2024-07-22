import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_storage_sqflite_demo/core/todo_local_data_base.dart';
import '../../model/todo_model.dart';

part 'create_todo_event.dart';
part 'create_todo_state.dart';

class CreateTodoBloc extends Bloc<CreateTodoEvent, CreateTodoState> {
  CreateTodoBloc()
      : super(const CreateTodoStateAdd(status: CreateTodoStatus.initial)) {
    on<CreateTodoEventSave>(_onCreateTodoEventSave);
    on<CreateTodoEventUpdate>(_onCreateTodoEventUpdate);
  }

  FutureOr<void> _onCreateTodoEventSave(
    CreateTodoEventSave event,
    Emitter<CreateTodoState> emit,
  ) async {
    emit(
      const CreateTodoStateAdd(
        status: CreateTodoStatus.loading,
      ),
    );

    final todoModel = TodoModel(
      title: event.title,
      description: event.description,
      isCompleted: false,
      createdAt: DateTime.now(),
    );
    await TodoLocalDatabase.instance.add(todoModel);
    emit(
      const CreateTodoStateAdd(
        status: CreateTodoStatus.completed,
      ),
    );
  }

  FutureOr<void> _onCreateTodoEventUpdate(
    CreateTodoEventUpdate event,
    Emitter<CreateTodoState> emit,
  ) async {
    emit(
      const CreateTodoStateUpdate(
        status: CreateTodoStatus.loading,
      ),
    );
    await TodoLocalDatabase.instance.update(
      event.todoModel.copyWith(
        updatedAt: DateTime.now(),
      ),
    );
    emit(
      const CreateTodoStateUpdate(
        status: CreateTodoStatus.completed,
      ),
    );
  }
}