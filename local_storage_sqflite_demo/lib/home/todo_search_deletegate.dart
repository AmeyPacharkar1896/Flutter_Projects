import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_storage_sqflite_demo/all_todos/bloc/all_todos_bloc.dart';
import 'package:local_storage_sqflite_demo/all_todos/bloc/all_todos_event.dart';
import 'package:local_storage_sqflite_demo/all_todos/widget/todo_list_builder.dart';

class TodoSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    log('Search query : $query');
    context.read<AllTodoBloc>().add(
          AllTodoEventFetch(query: query),
        );
    return const TodoListBuilder();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    log('Search query : $query');
    context.read<AllTodoBloc>().add(
          AllTodoEventFetch(query: query),
        );
    return const TodoListBuilder();
  }
}
