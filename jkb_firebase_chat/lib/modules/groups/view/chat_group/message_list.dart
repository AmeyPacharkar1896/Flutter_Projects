import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/modules/groups/bloc/group_bloc.dart';

class MessageList extends StatelessWidget {
  final String groupId;

  MessageList({required this.groupId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupBloc, GroupState>(
      builder: (context, state) {
        if (state.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          reverse: true,
          itemCount: state.messages.length,
          itemBuilder: (context, index) {
            final message = state.messages[index];
            return ListTile(
              title: Text(
                message.text,
                style: TextStyle(color: Colors.blue),
              ),
              subtitle:
                  Text(message.sentBy), // Adjust according to your data model
            );
          },
        );
      },
    );
  }
}
