import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/modules/search_user/bloc/search_user_bloc.dart';

class SearchListViewBuilder extends StatelessWidget {
  const SearchListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<SearchUserBloc, SearchUserState>(
          builder: ((context, state) {
            if (state.isLoading) {
              return const CircularProgressIndicator();
            } else {
              return Expanded(
                child: ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: ((context, index) {
                    final user = state.users[index];
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          _getFirstCharacter(user.name),
                        ),
                      ),
                      title: Text(user.name ?? ''),
                    );
                  }),
                ),
              );
            }
          }),
        ),
      ],
    );
  }

  String _getFirstCharacter(String? email) {
    final firstChar = email?.characters.firstOrNull;
    return firstChar?.toUpperCase() ?? '#';
  }
}
