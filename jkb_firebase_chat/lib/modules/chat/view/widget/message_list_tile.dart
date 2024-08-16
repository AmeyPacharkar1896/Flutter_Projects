import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jkb_firebase_chat/modules/chat/bloc/chat_bloc.dart';
import 'package:jkb_firebase_chat/modules/chat/model/message_model.dart';

class MessageListTile extends StatelessWidget {
  const MessageListTile({
    super.key,
    required this.message,
  });

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    final isSentByYou = context.read<ChatBloc>().sender.id == message.id;

    return Row(
      mainAxisAlignment:
          isSentByYou ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Container(
          width: 250,
          decoration: BoxDecoration(
            color: isSentByYou
                ? Theme.of(context).colorScheme.primaryContainer
                : Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(8),
              topRight: const Radius.circular(8),
              bottomLeft: isSentByYou ? const Radius.circular(8) : Radius.zero,
              bottomRight: isSentByYou ? Radius.zero : const Radius.circular(8),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                ),
                child: _getMessageBody(message, context, isSentByYou),
                
              ),
              Text(
                DateFormat('hh:mm aa').format(message.sentAt),
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _getMessageBody(
    MessageModel messageModel,
    BuildContext context,
    bool isSentByYou,
  ) {
    log(messageModel.text);
    switch (messageModel.type) {
      case MessageType.text:
        return Text(
          messageModel.text,
        );
      case MessageType.image:
        return const Text('No image found');
    }
  }
}
