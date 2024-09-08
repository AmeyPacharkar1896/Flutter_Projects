import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/modules/auth/bloc/auth_bloc.dart';
import 'package:jkb_firebase_chat/modules/chat/view/chat_page.dart';
import 'package:jkb_firebase_chat/modules/search_user/bloc/search_user_bloc.dart';

// ignore: must_be_immutable
class SearchListViewBuilder extends StatefulWidget {
  SearchListViewBuilder({
    super.key,
    required this.isGroupMemberSearch,
  });

  final bool isGroupMemberSearch;

  @override
  State<SearchListViewBuilder> createState() => _SearchListViewBuilderState();
}

class _SearchListViewBuilderState extends State<SearchListViewBuilder> {
  bool isSelected = false;

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
                      onTap: widget.isGroupMemberSearch
                          ? null
                          : () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ChatPage(
                                    sender: context
                                        .read<AuthBloc>()
                                        .state
                                        .currentUser!,
                                    receiver: user,
                                  ),
                                ),
                              );
                            },
                      leading: widget.isGroupMemberSearch
                          ? Checkbox(
                              value: isSelected,
                              onChanged: (value) {
                                setState(() {
                                  isSelected = value!;
                                });
                                log(isSelected.toString());
                                log(value.toString());
                              })
                          : CircleAvatar(
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
