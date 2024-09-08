import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/modules/auth/model/user_model.dart';
import 'package:jkb_firebase_chat/modules/auth/service/auth_firebase_service.dart';
import 'package:jkb_firebase_chat/modules/chat/model/message_model.dart';
import 'package:jkb_firebase_chat/modules/groups/service/firestore_group_service.dart';

part 'group_state.dart';
part 'group_event.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> {
  GroupBloc({
    required this.admin,
  }) : super(
          GroupState(
            isLoading: false,
            groupId: '',
            messages: [],
            members: [],
          ),
        ) {
    on<GroupEventInitialize>(_onGroupEventInitialize);
    on<GroupEventSendGroupMessage>(_onGroupEventSendGroupMessage);
    on<GroupEventAddGroupMember>(_onGroupEventAddGroupMember);
    on<GroupEventSelectGroupMembers>(_onGroupEventSelectGroupMembers);
  }

  final UserModel admin;
  late String groupId;

  final _client = FirestoreGroupService();
  final _authService = AuthFirebaseService();

  TextEditingController? messageController;

  Future<void> _onGroupEventInitialize(
    GroupEventInitialize event,
    Emitter<GroupState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      if(!event.isCreated) {
        groupId = await _client.createGroupChat(admin: admin);
      }

      final messageStream = _client.getGroupMessages(groupId: groupId);
      final memberStream = _client.getGroupMembers(groupId: groupId);

      await emit.forEach<List<MessageModel>>(
        messageStream,
        onData: (messages) {
          return state.copyWith(
            isLoading: false,
            groupId: groupId,
            messages: messages,
          );
        },
      );

      final members = await memberStream.first;
      emit(state.copyWith(members: members));

    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to initialize group: $e',
      ));
    }
  }

  Future<void> _onGroupEventSendGroupMessage(
    GroupEventSendGroupMessage event,
    Emitter<GroupState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final currentUser = _authService.currentUser;

    if (currentUser == null) {
      log('No current user found');
      emit(state.copyWith(isLoading: false));
      return;
    }

    final messageModel = MessageModel(
      senderName: currentUser.name ?? 'Unknown', 
      id: '',
      text: event.message,
      type: MessageType.text,
      sentAt: DateTime.now(),
      sentBy: currentUser.id,
    );

      final groupMemberStream = _client.getGroupMembers(groupId: groupId);
      final groupMemberList = await groupMemberStream.first;

      await _client.sendGroupMessage(
        messageModel: messageModel,
        groupId: groupId,
        groupMemberList: groupMemberList,
      );

      messageController?.clear();
      emit(state.copyWith(isLoading: false));

    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to send message: $e',
      ));
    }
  }

  Future<void> _onGroupEventAddGroupMember(
    GroupEventAddGroupMember event,
    Emitter<GroupState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      await _client.addNewGroupChatMember(groupId, event.newGroupMemberDetails);

      // Update the members list to include the new member
      final updatedMembers = List<UserModel>.from(state.members)
        ..add(event.newGroupMemberDetails);

      emit(state.copyWith(members: updatedMembers, isLoading: false));

    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to add group member: $e',
      ));
    }
  }

  FutureOr<void> _onGroupEventSelectGroupMembers(
    GroupEventSelectGroupMembers event,
    Emitter<GroupState> emit,
  ) {
    // Implement this event handler if needed
  }
}
