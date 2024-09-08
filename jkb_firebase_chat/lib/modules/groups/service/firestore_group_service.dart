import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jkb_firebase_chat/core/util/fire_store_collection.dart';
import 'package:jkb_firebase_chat/modules/auth/model/user_model.dart';
import 'package:jkb_firebase_chat/modules/chat/model/chat_model.dart';
import 'package:jkb_firebase_chat/modules/chat/model/message_model.dart';
import 'package:jkb_firebase_chat/modules/chat/service/chat_firestore_service.dart';
import 'package:jkb_firebase_chat/modules/groups/model/group_model.dart';

class FirestoreGroupService {
  final _client = FirebaseFirestore.instance;
  final _chatService = ChatFirestoreService();

  Stream<List<UserModel>> getGroupMembers({
    required String groupId,
  }) {
    return _client
        .collection(FirestoreCollections.groupChat)
        .doc(groupId)
        .collection(FirestoreCollections.groupChatMembers)
        .snapshots()
        .map(
          (query) => query.docs
              .map(
                (docs) => UserModel.fromMap(
                  docs.data(),
                ),
              )
              .toList(),
        );
  }

  Future<String> createGroupChat({
    required UserModel admin,
  }) async {
    final ref = _client.collection(FirestoreCollections.groupChat).doc();

    final groupId = ref.id;
    final groupModel = GroupModel(
      id: groupId,
      adminName: admin.name ?? 'null',
      adminId: admin.id,
      createdAt: DateTime.now(),
    );
    await ref.set(
      groupModel.toMap(
        groupModel: groupModel,
      ),
    );
    await addNewGroupChatMember(groupId, admin);

    final chatModel = ChatModel(
      id: groupId,
      createdAt: DateTime.now(),
      createdBy: admin.id,
    );

    await _chatService.createRecentChat(
      user: admin,
      chatModel: chatModel,
    );
    
    return groupId;
  }

  Future<void> addNewGroupChatMember(
    String groupId,
    UserModel newGroupMemberDetails,
  ) async {
    await _client
        .collection(FirestoreCollections.groupChat)
        .doc(groupId)
        .collection(FirestoreCollections.groupChatMembers)
        .doc(newGroupMemberDetails.id)
        .set(
          newGroupMemberDetails.toMap(),
        );

    final chatModel = ChatModel(
      id: groupId,
      createdAt: DateTime.now(),
      createdBy: newGroupMemberDetails.id,
    );

    await _chatService.createRecentChat(
      user: newGroupMemberDetails,
      chatModel: chatModel,
    );
  }

  Future<void> sendGroupMessage({
    required MessageModel messageModel,
    required String groupId,
    required List<UserModel> groupMemberList,
  }) async {
    final ref = _client
        .collection(FirestoreCollections.groupChat)
        .doc(groupId)
        .collection(FirestoreCollections.messages)
        .doc();

    final model = messageModel.copyWith(id: ref.id);
    await ref.set(model.toMap());

    for (final member in groupMemberList) {
      final chatModel = ChatModel(
        id: groupId,
        createdAt: DateTime.now(),
        createdBy: messageModel.sentBy,
      );

      await _chatService.createRecentChat(
        user: member,
        chatModel: chatModel,
      );
    }
  }

  Stream<List<MessageModel>> getGroupMessages({
    required String groupId,
  }) {
    return _client
        .collection(FirestoreCollections.groupChat)
        .doc(groupId)
        .collection(FirestoreCollections.messages)
        .orderBy(
          'sentAt',
          descending: true,
        )
        .snapshots()
        .map(
          (query) => query.docs
              .map(
                (doc) => MessageModel.fromMap(
                  doc.data(),
                ),
              )
              .toList(),
        );
  }

  // createRecentChat({
  //   required UserModel user,
  //   required GroupModel groupModel,
  // }) async {
  //   final ref =
  //       _client.collection(FirestoreCollections.recentChats).doc(user.id);
  //   await ref.set(groupModel.toMap(groupModel: groupModel));
  //   final reference = ref
  //       .collection(FirestoreCollections.userRecentChatsList)
  //       .doc(groupModel.id);
  //   final model = RecentChatModel(chatId: groupModel.id);
  //   return await reference.set(model.toMap());
  // }
}
