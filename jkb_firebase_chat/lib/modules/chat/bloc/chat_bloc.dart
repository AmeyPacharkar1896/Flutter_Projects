import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/modules/auth/model/user_model.dart';
import 'package:jkb_firebase_chat/modules/auth/service/auth_firebase_service.dart';
import 'package:jkb_firebase_chat/modules/chat/model/message_model.dart';
import 'package:jkb_firebase_chat/modules/chat/service/chat_firestore_service.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc({
    required this.receiver,
    required this.sender,
  }) : super(ChatState(
          isLoading: false,
          receiver: receiver,
        )) {
    on<ChatEventInitialize>(_onChatEventInitialize);
    on<ChatEventSendMessage>(_onChatEventSendMessage);
  }

  final UserModel receiver;
  final UserModel sender;

  final ChatFirestoreService _service = ChatFirestoreService();
  final AuthFirebaseService _authService = AuthFirebaseService();

  late final String _chatId;

  TextEditingController? messageController;

  Future<void> _onChatEventInitialize(
    ChatEventInitialize event,
    Emitter<ChatState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      _chatId = await _service.createChat(
        receiver: receiver,
        sender: sender,
      );

      final messageStream = _service.getMessages(chatId: _chatId);

      await emit.forEach<List<MessageModel>>(
        messageStream,
        onData: (messages) => state.copyWith(
          isLoading: false,
          messages: messages,
        ),
        onError: (error, stackTrace) {
          log('Error loading messages: $error');
          return state.copyWith(isLoading: false);
        },
      );
    } catch (error) {
      log('Error initializing chat: $error');
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onChatEventSendMessage(
    ChatEventSendMessage event,
    Emitter<ChatState> emit,
  ) async {
    log('Sending message at: ${DateTime.now()}');
    emit(state.copyWith(isLoading: true));

    final currentUser = _authService.currentUser;

    if (currentUser == null) {
      log('No current user found');
      emit(state.copyWith(isLoading: false));
      return;
    }

    final model = MessageModel(
      senderName: currentUser.name ?? 'Unknown', 
      id: '',
      text: event.message,
      type: MessageType.text,
      sentAt: DateTime.now(),
      sentBy: sender.id,
    );

    try {
      await _service.sendMessage(message: model, chatId: _chatId);
      messageController?.clear();
    } catch (error) {
      log('Error sending message: $error');
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
