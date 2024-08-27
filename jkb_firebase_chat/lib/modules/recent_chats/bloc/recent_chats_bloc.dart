import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/modules/auth/service/auth_firebase_service.dart';
import 'package:jkb_firebase_chat/modules/recent_chats/model/recent_chat_message_model.dart';
import 'package:jkb_firebase_chat/modules/recent_chats/service/firestore_recent_chat_service.dart';
import 'package:rxdart/rxdart.dart';

part 'recent_chats_state.dart';
part 'recent_chats_event.dart';

class RecentChatsBloc extends Bloc<RecentChatsEvent, RecentChatsState> {
  RecentChatsBloc() : super(const RecentChatsStateInitial()) {
    on<RecentChatsEventInitialize>(_onRecentChatsEventInitialize);
  }

  final _firestoreRecentChatService = FirestoreRecentChatService();

  _onRecentChatsEventInitialize(
    RecentChatsEventInitialize event,
    Emitter<RecentChatsState> emit,
  ) async {
    emit(RecentChatsStateLoading(isLoading: true));
    final userId = AuthFirebaseService().currentUser?.id;
    if (userId != null) {
      final streamListOfRecentChats =
          _firestoreRecentChatService.getRecentChatsForUser(userId);
      final streamRecentChatMessageModels = streamListOfRecentChats.switchMap(
        (listRecentChatModel) {
          return Rx.combineLatest(
              listRecentChatModel.map(
                (recentChatModel) => _firestoreRecentChatService
                    .getRecentChatMessageStream(recentChatModel)
                    .map(
                      (recentChatMessageModel) => RecentChatMessageModel(
                          user: recentChatMessageModel.user,
                          message: recentChatMessageModel.message),
                    ),
              ),
              (List<RecentChatMessageModel> combineList) => combineList);
        },
      );
      await emit.forEach(
        streamRecentChatMessageModels,
        onData: (chats) => RecentChatsStateLoaded(chats: chats),
        onError: ((error, stackTrace) {
          log('Error fetching recent chats: $error');
          return RecentChatsStateError(error: error.toString());
        }),
      );
    } else {
      emit(RecentChatsStateError(error: 'User is not authenticated'));
    }
  }
}
