part of 'create_todo_bloc.dart';

abstract class CreateTodoState {
  const CreateTodoState({
    required this.status,
  });

  final CreateTodoStatus status;
}

enum CreateTodoStatus {
  initial,
  loading,
  completed,
}

class CreateTodoStateAdd extends CreateTodoState {
  const CreateTodoStateAdd({
    required super.status,
  });
}

class CreateTodoStateUpdate extends CreateTodoState {
  const CreateTodoStateUpdate({
    required super.status,
  });
}