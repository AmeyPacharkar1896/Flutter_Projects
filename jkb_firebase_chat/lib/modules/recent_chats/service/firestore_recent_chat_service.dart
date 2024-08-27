import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jkb_firebase_chat/core/util/fire_store_collection.dart';
import 'package:jkb_firebase_chat/modules/auth/model/user_model.dart';
import 'package:jkb_firebase_chat/modules/auth/service/auth_firebase_service.dart';
import 'package:jkb_firebase_chat/modules/chat/model/message_model.dart';
import 'package:jkb_firebase_chat/modules/chat/model/recent_chat_model.dart';
import 'package:jkb_firebase_chat/modules/recent_chats/model/recent_chat_message_model.dart';
import 'package:rxdart/rxdart.dart';

class FirestoreRecentChatService {
  final _client = FirebaseFirestore.instance;

  CollectionReference<RecentChatModel> getRecentChatCollection(String userId) {
    return _client
        .collection(FirestoreCollections.recentChats)
        .doc(userId)
        .collection(FirestoreCollections.userChatsList)
        .withConverter<RecentChatModel>(
          fromFirestore: (snapshot, options) {
            final data = snapshot.data();
            if (data != null) {
              return RecentChatModel.fromMap(data);
            } else {
              log("RecentChatModel is null in Firestore data");
              throw Exception("RecentChatModel is null in Firestore data");
            }
          },
          toFirestore: (value, options) => value.toMap(),
        );
  }

  Stream<List<RecentChatModel>> getRecentChatsForUser(String userId) {
    return getRecentChatCollection(userId).snapshots().map(
          (querySnapshot) => querySnapshot.docs
              .map((doc) => doc.data())
              .toList(),
        );
  }

  Stream<RecentChatMessageModel> getRecentChatMessageStream(
    RecentChatModel recentChatModel,
  ) {
    final chatId = recentChatModel.chatId;
    final currentUser = AuthFirebaseService().currentUser;

    if (currentUser == null) {
      throw Exception("Current user is null");
    }

    final senderUserId = _extractSenderUserId(
      chatId: chatId,
      currentUser: currentUser.id,
    );
    final messageStream = _getMessageStream(chatId);
    final userStream = _getUserStream(senderUserId);

    return Rx.combineLatest2(
      messageStream,
      userStream,
      (MessageModel message, UserModel user) {
        return RecentChatMessageModel(
          user: user,
          message: message,
        );
      },
    ).handleError((error) {
      log('Error in getRecentChatMessageStream: $error');
    });
  }

  String _extractSenderUserId({
    required String chatId,
    required String currentUser,
  }) {
    final splitList = chatId.split('_');
    return splitList.firstWhere(
      (user) => user != currentUser,
      orElse: () => currentUser,
    );
  }

  Stream<MessageModel> _getMessageStream(String chatId) {
    return _client
        .collection(FirestoreCollections.chats)
        .doc(chatId)
        .collection(FirestoreCollections.messages)
        .orderBy('sentAt', descending: true)
        .limit(1)
        .snapshots()
        .map(
          (query) => query.docs.isNotEmpty
              ? MessageModel.fromMap(query.docs.first.data())
              : throw Exception("No messages found for chatId: $chatId"),
        );
  }

  Stream<UserModel> _getUserStream(String senderUserId) {
    return _client
        .collection(FirestoreCollections.users)
        .doc(senderUserId)
        .snapshots()
        .map(
          (doc) {
            final data = doc.data();
            if (data != null) {
              return UserModel.fromMap(data);
            } else {
              throw Exception("User not found with ID: $senderUserId");
            }
          },
        );
  }
}
