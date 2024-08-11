part of 'search_user_bloc.dart';

class SearchUserEvent {}

class SearchUserEventQueryChanged extends SearchUserEvent {
  SearchUserEventQueryChanged({
    required this.query,
  });

  final String query;
}

class SearchUserEventSuggestionResult extends SearchUserEvent {
  SearchUserEventSuggestionResult({
    required this.query,
  });
  
  final String query;
}
