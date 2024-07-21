part of 'create_todo_bloc.dart';

enum CreateTodoStatus {
  initial,
  loading,
  completed,
}

class CreateTodoState {
  const CreateTodoState({
    required this.status,
  });

  final CreateTodoStatus status;
}