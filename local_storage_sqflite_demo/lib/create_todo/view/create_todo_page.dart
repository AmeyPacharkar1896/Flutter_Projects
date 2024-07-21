import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_storage_sqflite_demo/create_todo/bloc/create_todo_bloc.dart';
import 'package:local_storage_sqflite_demo/create_todo/view/create_todo_screen.dart';
import 'package:local_storage_sqflite_demo/model/todo_model.dart';

class CreateTodoPage extends StatelessWidget {
  const CreateTodoPage({
    super.key,
    this.todoModel,
  });

  final TodoModel? todoModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateTodoBloc(),
      child: CreateTodoScreen(
        todoModel: todoModel,
      ),
    );
  }
}
