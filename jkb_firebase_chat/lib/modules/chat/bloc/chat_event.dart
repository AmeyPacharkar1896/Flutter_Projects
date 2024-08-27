part of 'chat_bloc.dart';

abstract class ChatEvent {
  const ChatEvent();
}

class ChatEventInitialize extends ChatEvent {
  const ChatEventInitialize();
}

class ChatEventSendMessage extends ChatEvent {
  const ChatEventSendMessage({
    required this.message,
  });

  final String message;
}