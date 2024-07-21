import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_storage_sqflite_demo/all_todos/bloc/all_todos_bloc.dart';
import 'package:local_storage_sqflite_demo/create_todo/view/create_todo_page.dart';

class AllTodoScreen extends StatelessWidget {
  const AllTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Storage Example'),
      ),
      body: BlocBuilder<AllTodoBloc, AllTodoState>(
        builder: (context, state) {
          if (state is AllTodoInitialState) {
            context.read<AllTodoBloc>().add(const AllTodoEventFetch());
          } else if (state is AllToDoLoadingState) {
            return const CircularProgressIndicator();
          } else if (state is AllTodoLoadedState) {
            return ListView.separated(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                final todo = state.todos[index];
                return ListTile(
                  title: Text(
                    todo.title,
                    maxLines: 2,
                  ),
                  subtitle: todo.description != null
                      ? Text(
                          todo.description!,
                          maxLines: 2,
                        )
                      : null,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CreateTodoPage(
                          todoModel: todo,
                        ),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (_, __) => const Divider(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
