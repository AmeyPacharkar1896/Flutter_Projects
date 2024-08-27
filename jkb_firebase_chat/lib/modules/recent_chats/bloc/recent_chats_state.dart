part of 'recent_chats_bloc.dart';

abstract class RecentChatsState {
  const RecentChatsState();
}

class RecentChatsStateInitial extends RecentChatsState {
  const RecentChatsStateInitial({
    this.chats,
  });

  final List<RecentChatMessageModel>? chats;
}

class RecentChatsStateLoading extends RecentChatsState {
  RecentChatsStateLoading({
    required this.isLoading,
  });

  final bool isLoading;
}

class RecentChatsStateLoaded extends RecentChatsState {
  const RecentChatsStateLoaded({
    required this.chats,
  });

  final List<RecentChatMessageModel> chats;

  RecentChatsStateLoaded copyWith({
    List<RecentChatMessageModel>? chats,
  }) {
    return RecentChatsStateLoaded(
      chats: chats ?? this.chats,
    );
  }
}

class RecentChatsStateError extends RecentChatsState {
  RecentChatsStateError({
    required this.error,
  });

  final String error;
}
