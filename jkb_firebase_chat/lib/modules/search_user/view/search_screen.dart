import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/modules/search_user/bloc/search_user_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchQueryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<SearchUserBloc, SearchUserState>(
          builder: (context, state) {
            return TextField(
              decoration: InputDecoration(
                hintText: 'Search users...',
                border: InputBorder.none,
                suffixIcon: state.isLoading
                    ? const CircularProgressIndicator()
                    : IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          context.read<SearchUserBloc>().add(
                                SearchUserEventQueryChanged(query: ''),
                              );
                        },
                      ),
              ),
              onChanged: (query) {
                context.read<SearchUserBloc>().add(
                      SearchUserEventQueryChanged(query: ''),
                    );
              },
            );
          },
        ),
      ),
      body: BlocBuilder<SearchUserBloc, SearchUserState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.users.isEmpty) {
            return const Center(child: Text('No users found'));
          }

          return ListView.builder(
            itemCount: state.users.length,
            itemBuilder: (context, index) {
              final user = state.users[index];
              return ListTile(
                title: Text(user.name ?? ''),
                subtitle: Text(user.email ?? ''),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    searchQueryController.dispose();
    super.dispose();
  }
}
