import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/modules/groups/bloc/group_bloc.dart';

class AddMemberDialog extends StatelessWidget {
  final String groupId;

  AddMemberDialog({required this.groupId});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<GroupBloc>();

    return AlertDialog(
      title: Text('Add Members'),
      content: BlocBuilder<GroupBloc, GroupState>(
        builder: (context, state) {
          // Example of how to fetch and display users
          // You might need to implement a method in your bloc to fetch users
          return ListView.builder(
            itemCount: state.members.length, // Replace with actual members list
            itemBuilder: (context, index) {
              final user = state.members[index];
              return ListTile(
                title: Text(user.name ?? '-'),
                trailing: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    bloc.add(GroupEventAddGroupMember(newGroupMemberDetails: user, groupId: groupId));
                  },
                ),
              );
            },
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
