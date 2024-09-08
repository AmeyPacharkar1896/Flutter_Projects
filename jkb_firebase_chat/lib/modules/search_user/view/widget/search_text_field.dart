import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/modules/search_user/bloc/search_user_bloc.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.searchQueryController,
    required this.isLoading
  });

  final TextEditingController searchQueryController;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchQueryController,
      decoration: InputDecoration(
        hintText: 'Search users...',
        border: InputBorder.none,
        suffixIcon: isLoading
            ? const CircularProgressIndicator()
            : IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  searchQueryController.clear();
                },
              ),
      ),
      onChanged: (query) {
        log(searchQueryController.text);
        context.read<SearchUserBloc>().add(
              SearchUserEventQueryChanged(
                  query: searchQueryController.text),
            );
      },
    );
  }
}
