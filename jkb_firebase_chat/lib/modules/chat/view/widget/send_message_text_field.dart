import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/modules/chat/bloc/chat_bloc.dart';
import 'package:jkb_firebase_chat/modules/chat/view/widget/send_message_button.dart';

class SendMessageTextField extends StatefulWidget {
  const SendMessageTextField({
    super.key,
  });

  @override
  State<SendMessageTextField> createState() => _SendMessageTextFieldState();
}

class _SendMessageTextFieldState extends State<SendMessageTextField> {
  @override
  void initState() {
    super.initState();
    messageController = TextEditingController();
    final bloc = context.read<ChatBloc>();
    bloc.messageController = messageController;
  }

  late final TextEditingController messageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 8,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: const InputDecoration(
                hintText: 'Enter your message...',
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 4),
          Center(
            child: SendMessageButton(
              onPressed: () {
                log(messageController.text);
                if (messageController.text.isNotEmpty) {
                  context.read<ChatBloc>().add(
                        ChatEventSendMessage(
                          message: messageController.text,
                        ),
                      );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
  }
}
