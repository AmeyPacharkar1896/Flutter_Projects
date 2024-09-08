import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/modules/groups/bloc/group_bloc.dart';

class MessageInput extends StatelessWidget {
  final String groupId;

  MessageInput({required this.groupId});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<GroupBloc>();
    final controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              final message = controller.text.trim();
              if (message.isNotEmpty) {
                bloc.add(GroupEventSendGroupMessage(message: message));
                controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
