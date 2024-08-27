import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jkb_firebase_chat/modules/auth/service/auth_firebase_service.dart';
import 'package:jkb_firebase_chat/modules/chat/view/chat_page.dart';
import 'package:jkb_firebase_chat/modules/recent_chats/model/recent_chat_message_model.dart';

// ignore: must_be_immutable
class RecentChatListTile extends StatelessWidget {
  RecentChatListTile({
    super.key,
    required this.chat,
  });

  RecentChatMessageModel chat;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Center(
          child: Text(
            _getFirstCharacter(chat.user.name),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      title: Text(chat.user.name ?? ''),
      subtitle: Text(chat.message.text),
      trailing: Text(
        DateFormat('hh:mm aa').format(chat.message.sentAt),
      ),
      onTap: () {
        final receiver = chat.user;
        final sender = AuthFirebaseService().currentUser;

        if (sender != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ChatPage(
                sender: sender,
                receiver: receiver,
              ),
            ),
          );
        }
      },
    );
  }

  String _getFirstCharacter(String? name) {
    final firstChar = name?.characters.firstOrNull;
    return firstChar?.toUpperCase() ?? '#';
  }
}
