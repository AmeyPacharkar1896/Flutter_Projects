part of 'group_bloc.dart';

class GroupState {
  GroupState({
    required this.isLoading,
    required this.groupId,
    required this.messages,
    required this.members,
    this.errorMessage,
  });

  final bool isLoading;
  final String groupId;
  final List<MessageModel> messages;
  final List<UserModel> members;
  final String? errorMessage;

  GroupState copyWith({
    bool? isLoading,
    String? groupId,
    List<MessageModel>? messages,
    List<UserModel>? members,
    String? errorMessage,
  }) {
    return GroupState(
      isLoading: isLoading ?? this.isLoading,
      groupId: groupId ?? this.groupId,
      messages: messages ?? this.messages,
      members: members ?? this.members,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
