import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/modules/auth/model/user_model.dart';
import 'package:jkb_firebase_chat/modules/auth/service/auth_firebase_service.dart';
import 'package:jkb_firebase_chat/modules/groups/bloc/group_bloc.dart';
import 'package:jkb_firebase_chat/modules/search_user/bloc/search_user_bloc.dart';
import 'package:jkb_firebase_chat/modules/search_user/view/search_screen.dart';

class SearchPage extends StatelessWidget {
  SearchPage({
    super.key,
    required this.isGroupMemberSearch,
    required this.groupId,
  });

  final _client = AuthFirebaseService();
  final bool isGroupMemberSearch;
  final String? groupId;

  @override
  Widget build(BuildContext context) {
    UserModel? admin = _client.currentUser;
    if (admin != null) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<SearchUserBloc>(
            create: (_) => SearchUserBloc(),
          ),
          BlocProvider(
            create: (_) => GroupBloc(admin: admin),
          )
        ],
        child: SearchScreen(
          isGroupMemberSearch: isGroupMemberSearch,
          groupId: groupId,
        ),
      );
    }
    return Container();
  }
}
