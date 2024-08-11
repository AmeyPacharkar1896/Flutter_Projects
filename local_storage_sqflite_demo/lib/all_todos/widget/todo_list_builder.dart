import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_storage_sqflite_demo/all_todos/bloc/all_todos_bloc.dart';
import 'package:local_storage_sqflite_demo/all_todos/bloc/all_todos_event.dart';
import 'package:local_storage_sqflite_demo/all_todos/bloc/all_todos_state.dart';

import '../../create_todo/view/create_todo_page.dart';

class TodoListBuilder extends StatelessWidget {
  const TodoListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllTodoBloc, AllTodoState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.todos.isEmpty) {
          return const Center(
            child: Text('No todos found!'),
          );
        }
        return ListView.separated(
          itemCount: state.todos.length,
          itemBuilder: (context, index) {
            final todoModel = state.todos[index];
            return ListTile(
              leading: Checkbox(
                value: todoModel.isCompleted,
                onChanged: (value) {
                  context.read<AllTodoBloc>().add(
                        AllTodoEventCompleteNotUncomplete(todoModel: todoModel),
                      );
                },
              ),
              title: Text(
                todoModel.title,
                maxLines: 2,
              ),
              subtitle: todoModel.description != null
                  ? Text(
                      todoModel.description!,
                      maxLines: 2,
                    )
                  : null,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CreateTodoPage(
                      todoModel: todoModel,
                    ),
                  ),
                );
              },
            );
          },
          separatorBuilder: (_, __) => const Divider(),
        );
      },
    );
  }
}
