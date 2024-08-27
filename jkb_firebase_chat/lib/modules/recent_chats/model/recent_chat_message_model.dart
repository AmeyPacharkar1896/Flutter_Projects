import 'package:jkb_firebase_chat/modules/auth/model/user_model.dart';
import 'package:jkb_firebase_chat/modules/chat/model/message_model.dart';

class RecentChatMessageModel {
  const RecentChatMessageModel({
    required this.user,
    required this.message,
  });
  
  final UserModel user;
  final MessageModel message;
}
