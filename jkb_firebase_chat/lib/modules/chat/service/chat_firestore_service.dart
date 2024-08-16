import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jkb_firebase_chat/core/util/fire_store_collection.dart';
import 'package:jkb_firebase_chat/modules/auth/model/user_model.dart';
import 'package:jkb_firebase_chat/modules/chat/model/chat_model.dart';
import 'package:jkb_firebase_chat/modules/chat/model/message_model.dart';

class ChatFirestoreService {
  final _client = FirebaseFirestore.instance;

  Future<String> createChat({
    required UserModel receiver,
    required UserModel sender,
  }) async {
    final chatId = _getChatId(sender: sender, receiver: receiver);
    final ref = _client.collection('chats').doc(chatId);
    final isChatCreated = await ref.get().then((doc) => doc.exists);
    if (isChatCreated) return chatId;
    final model = ChatModel(
      id: chatId,
      createdAt: DateTime.now(),
      createdBy: sender.id,
    );
    await ref.set(model.toMap());
    return chatId;
  }

  Future<void> sendMessage({
    required MessageModel message,
    required String chatId,
  }) async {
    final ref = _getMessagesRef(chatId).doc();
    final model = message.copyWith(id: ref.id);
    return await ref.set(model.toMap());
  }

  Stream<List<MessageModel>> getMessages({
    required String chatId,
  }) {
    final ref = _getMessagesRef(chatId).orderBy(
      'sentAt',
      descending: true,
    );
    return ref.snapshots().map((query) => query.docs
        .map(
          (docs) => MessageModel.fromMap(docs.data()),
        )
        .toList());
  }

  String _getChatId({
    required UserModel sender,
    required UserModel receiver,
  }) {
    final senderId = sender.id;
    final receiverId = receiver.id;
    return receiverId.compareTo(senderId) > 0
        ? '${receiverId}_$senderId'
        : '${senderId}_$receiverId';
  }

  CollectionReference<Map<String, dynamic>> _getMessagesRef(String chatId) {
    return _client
        .collection(FirestoreCollections.chats)
        .doc(chatId)
        .collection(FirestoreCollections.messages);
  }
}
