import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/modules/auth/model/user_model.dart';
import 'package:jkb_firebase_chat/modules/groups/bloc/group_bloc.dart';
import 'package:jkb_firebase_chat/modules/search_user/bloc/search_user_bloc.dart';
import 'package:jkb_firebase_chat/modules/search_user/view/widget/search_list_view_builder.dart';
import 'package:jkb_firebase_chat/modules/search_user/view/widget/search_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
    required this.isGroupMemberSearch,
    required this.groupId,
  });

  final bool isGroupMemberSearch;
  final String? groupId;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchQueryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: BlocBuilder<SearchUserBloc, SearchUserState>(
        builder: (context, state) {
          return SearchTextField(
            searchQueryController: searchQueryController,
            isLoading: state.isLoading,
          );
        },
      ),
    ), body: BlocBuilder<SearchUserBloc, SearchUserState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.users.isEmpty) {
          return const Center(child: Text('No users found'));
        }

        return SearchListViewBuilder(
          isGroupMemberSearch: widget.isGroupMemberSearch,
        );
      },
    ), floatingActionButton:
        BlocBuilder<SearchUserBloc, SearchUserState>(builder: (context, state) {
      return widget.isGroupMemberSearch
          ? FloatingActionButton(
              onPressed: () {
                context.read().add(
                      GroupEventAddGroupMember(
                          newGroupMemberDetails: state.newGroupMemberDetails ?? const UserModel(id: 'Unknown'),
                          groupId: widget.groupId ?? 'Unknown'),
                    );
              },
            )
          : Container();
    }));
  }

  @override
  void dispose() {
    searchQueryController.dispose();
    super.dispose();
  }
}
