import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/modules/auth/model/user_model.dart';
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

  UserModel receiver;
  UserModel sender;

  final _service = ChatFirestoreService();

  late final String _chatId;

  TextEditingController? messageController;

  FutureOr<void> _onChatEventInitialize(
    ChatEventInitialize event,
    Emitter<ChatState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    _chatId = await _service.createChat(
      receiver: receiver,
      sender: sender,
    );
    final message = _service.getMessages(
      chatId: _chatId,
    );

    return emit.forEach(message, onData: (message) {
      return state.copyWith(
        isLoading: false,
        messages: message,
      );
    });
  }

  Future<FutureOr<void>> _onChatEventSendMessage(
    ChatEventSendMessage event,
    Emitter<ChatState> emit,
  ) async {
    emit(state.copyWith(
      isLoading: true,
    ));
    final messageModel = MessageModel(
      id: '',
      text: event.message,
      type: MessageType.text,
      sentAt: DateTime.now(),
      sentBy: sender.id,
    );
    await _service.sendMessage(
      message: messageModel,
      chatId: _chatId,
    );
    messageController?.clear();
    emit(state.copyWith(
      isLoading: false,
    ));
  }
}
