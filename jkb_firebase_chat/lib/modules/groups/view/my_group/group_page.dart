import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/modules/auth/model/user_model.dart';
import 'package:jkb_firebase_chat/modules/auth/service/auth_firebase_service.dart';
import 'package:jkb_firebase_chat/modules/groups/bloc/group_bloc.dart';
import 'package:jkb_firebase_chat/modules/groups/view/my_group/group_screen.dart';

class GroupPage extends StatelessWidget {
  GroupPage({
    super.key,
    required this.isCreated,
  });

  final _client = AuthFirebaseService();
  final bool isCreated;
  @override
  Widget build(BuildContext context) {
    UserModel? admin = _client.currentUser;

    if (admin != null) {
      return BlocProvider(
        create: (_) => GroupBloc(admin: admin),
        child: GroupScreen(
          admin: admin,
          isCreated: isCreated,
        ),
      );
    }
    return Container();
  }
}
