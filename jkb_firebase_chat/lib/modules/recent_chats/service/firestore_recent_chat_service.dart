import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jkb_firebase_chat/core/util/fire_store_collection.dart';
import 'package:jkb_firebase_chat/modules/auth/model/user_model.dart';
import 'package:jkb_firebase_chat/modules/chat/model/message_model.dart';
import 'package:jkb_firebase_chat/modules/chat/model/recent_chat_model.dart';
import 'package:jkb_firebase_chat/modules/recent_chats/model/recent_chat_message_model.dart';

class FirestoreRecentChatService {
  final FirebaseFirestore _client = FirebaseFirestore.instance;

  Stream<List<RecentChatModel>> fetchRecentChatsForUser(
    String userId,
  ) {
    return _client
        .collection(FirestoreCollections.recentChats)
        .doc(userId)
        .collection(FirestoreCollections.userRecentChatsList)
        .withConverter<RecentChatModel>(
          fromFirestore: (snapshot, _) =>
              RecentChatModel.fromMap(snapshot.data()!),
          toFirestore: (recentChatModel, _) => recentChatModel.toMap(),
        )
        .snapshots()
        .map((querySnapshot) =>
            querySnapshot.docs.map((doc) => doc.data()).toList())
        .handleError((error) {
      log('Error fetching recent chats: $error');
      throw Exception('Error fetching recent chats');
    });
  }

  Future<RecentChatMessageModel?> fetchRecentChatMessage(
    String chatId,
    String currentUserId,
  ) async {
    try {
      final senderUserId = _extractSenderUserId(chatId, currentUserId);

      final messageSnapshot = await _client
          .collection(FirestoreCollections.chats)
          .doc(chatId)
          .collection(FirestoreCollections.messages)
          .orderBy('sentAt', descending: true)
          .limit(1)
          .get();

      final message = messageSnapshot.docs.isNotEmpty
          ? MessageModel.fromMap(messageSnapshot.docs.first.data())
          : null;

      final userSnapshot = await _client
          .collection(FirestoreCollections.users)
          .doc(senderUserId)
          .get();

      final user =
          userSnapshot.exists ? UserModel.fromMap(userSnapshot.data()!) : null;

      if (message != null && user != null) {
        return RecentChatMessageModel(user: user, message: message);
      } else {
        return null;
      }
    } catch (e) {
      log('Error fetching recent chat message: $e');
      return null;
    }
  }

  String _extractSenderUserId(
    String chatId,
    String currentUserId,
  ) {
    final users = chatId.split('_');
    return users.firstWhere((user) => user != currentUserId,
        orElse: () => currentUserId);
    }
}
