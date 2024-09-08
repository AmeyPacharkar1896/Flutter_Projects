part of 'search_user_bloc.dart';

class SearchUserState {
  SearchUserState({
    required this.isLoading,
    required this.users,
    required this.newGroupMemberDetails,
  });

  final bool isLoading;
  final List<UserModel> users;
  final UserModel? newGroupMemberDetails;

  SearchUserState copyWith({
    bool? isLoading,
    List<UserModel>? users,
    UserModel? newGroupMemberDetails,
  }) {
    return SearchUserState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
      newGroupMemberDetails:
          newGroupMemberDetails ?? this.newGroupMemberDetails,
    );
  }
}
