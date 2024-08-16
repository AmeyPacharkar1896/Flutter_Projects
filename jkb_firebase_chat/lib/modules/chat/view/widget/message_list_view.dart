import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/modules/chat/bloc/chat_bloc.dart';
import 'package:jkb_firebase_chat/modules/chat/view/widget/message_list_tile.dart';

class MessageListView extends StatelessWidget {
  const MessageListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        final messages = state.messages;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 16),
            reverse: true,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              log(message.text);
              return MessageListTile(
                message: message,
              );
            },
          ),
        );
      },
    );
  }
}
