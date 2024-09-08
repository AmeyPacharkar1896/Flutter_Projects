part of 'group_bloc.dart';

abstract class GroupEvent {
  const GroupEvent();
}

class GroupEventInitialize extends GroupEvent {
  const GroupEventInitialize({
    required this.isCreated,
  });
  final bool isCreated;
}

class GroupEventSendGroupMessage extends GroupEvent {
  GroupEventSendGroupMessage({
    required this.message,
  });

  final String message;
}

class GroupEventAddGroupMember extends GroupEvent {
  GroupEventAddGroupMember({
    required this.newGroupMemberDetails,
    required this.groupId,
  });

  final UserModel newGroupMemberDetails;
  final String groupId;
}

class GroupEventSelectGroupMembers extends GroupEvent {
  GroupEventSelectGroupMembers({
    required this.isSelected,
  });

  final List<bool> isSelected;
}
