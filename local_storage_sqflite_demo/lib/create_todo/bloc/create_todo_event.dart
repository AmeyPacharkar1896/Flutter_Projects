part of 'create_todo_bloc.dart';

abstract class CreateTodoEvent {
  const CreateTodoEvent();
}

class CreateTodoEventSave extends CreateTodoEvent {
  const CreateTodoEventSave({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;
}

class CreateTodoEventUpdate extends CreateTodoEvent {
  const CreateTodoEventUpdate({
    required this.todoModel,
  });

  final TodoModel todoModel;
}