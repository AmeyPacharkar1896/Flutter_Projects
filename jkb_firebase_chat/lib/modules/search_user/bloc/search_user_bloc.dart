import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/modules/auth/model/user_model.dart';
import 'package:jkb_firebase_chat/modules/search_user/service/search_user_firestore_service.dart';

part 'search_user_state.dart';
part 'search_user_event.dart';

class SearchUserBloc extends Bloc<SearchUserEvent, SearchUserState> {
  SearchUserBloc() : super(SearchUserState(isLoading: false, users: [], newGroupMemberDetails: null)) {
    on<SearchUserEventQueryChanged>(_onSearchUserEventQueryChanged);
    on<SearchUserEventSuggestionResult>(_onSearchUserEventSuggestionResult);
  }

  final _service = SearchUserFirestoreService();
  Future<FutureOr<void>> _onSearchUserEventQueryChanged(
    SearchUserEventQueryChanged event,
    Emitter<SearchUserState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final response = await _service.searchUser(query: event.query);
    response.fold((l) {}, (r) {
      emit(state.copyWith(isLoading: false, users: r));
    });
  }

  FutureOr<void> _onSearchUserEventSuggestionResult(
    SearchUserEventSuggestionResult event,
    Emitter<SearchUserState> emit,
  ) {
    emit(state.copyWith(isLoading: true));
    
  }
}
