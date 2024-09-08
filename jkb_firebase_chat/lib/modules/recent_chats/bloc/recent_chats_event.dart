part of 'recent_chats_bloc.dart';

abstract class RecentChatsEvent {
  const RecentChatsEvent();
}

class RecentChatsEventInitialize extends RecentChatsEvent {
  const RecentChatsEventInitialize();
}

class RecentChatsEventCreateGroupRecentChat extends RecentChatsEvent {
  const RecentChatsEventCreateGroupRecentChat();
}
