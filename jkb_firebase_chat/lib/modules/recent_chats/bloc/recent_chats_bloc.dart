import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/modules/auth/service/auth_firebase_service.dart';
import 'package:jkb_firebase_chat/modules/recent_chats/model/recent_chat_message_model.dart';
import 'package:jkb_firebase_chat/modules/recent_chats/service/firestore_recent_chat_service.dart';

part 'recent_chats_state.dart';
part 'recent_chats_event.dart';

class RecentChatsBloc extends Bloc<RecentChatsEvent, RecentChatsState> {
  RecentChatsBloc() : super(const RecentChatsStateInitial()) {
    on<RecentChatsEventInitialize>(_onRecentChatsEventInitialize);
    on<RecentChatsEventCreateGroupRecentChat>(_onRecentChatsEventCreateGroupRecentChat);
  }

  final FirestoreRecentChatService _firestoreRecentChatService = FirestoreRecentChatService();

  Future<void> _onRecentChatsEventInitialize(
    RecentChatsEventInitialize event,
    Emitter<RecentChatsState> emit,
  ) async {
    emit(RecentChatsStateLoading(isLoading: true));
    final userId = AuthFirebaseService().currentUser?.id;

    if (userId != null) {
      final recentChatsStream = _firestoreRecentChatService.fetchRecentChatsForUser(userId);

      final transformedStream = recentChatsStream.asyncMap((recentChats) async {
        final chatMessageModels = await Future.wait(recentChats.map((chat) async {
          return await _firestoreRecentChatService.fetchRecentChatMessage(chat.chatId, userId);
        }));

        // Filter out any null or invalid results
        return chatMessageModels.whereType<RecentChatMessageModel>().toList();
      });

      await emit.forEach<List<RecentChatMessageModel>>(
        transformedStream,
        onData: (chats) => RecentChatsStateLoaded(chats: chats),
        onError: (error, stackTrace) {
          log('Error loading recent chats: $error');
          return const RecentChatsStateError(error: 'Failed to load recent chats');
        },
      );
    } else {
      emit(const RecentChatsStateError(error: 'User is not authenticated'));
    }
  }

  Future<void> _onRecentChatsEventCreateGroupRecentChat(
    RecentChatsEventCreateGroupRecentChat event,
    Emitter<RecentChatsState> emit,
  ) async {
    // Implement the logic for creating a group recent chat
  }
}
