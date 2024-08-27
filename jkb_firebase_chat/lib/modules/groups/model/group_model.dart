class GroupModel {
  GroupModel({
    required this.id,
    required this.isAdmin,
    required this.createdAt,
  });

  final String id;
  final bool isAdmin;
  final DateTime createdAt;

  GroupModel copyWith({String? id, bool? isAdmin, DateTime? createdAt}) {
    return GroupModel(
        id: id ?? this.id,
        isAdmin: isAdmin ?? this.isAdmin,
        createdAt: createdAt ?? this.createdAt);
  }

  Map<String, dynamic> toMap({
    required GroupModel groupModel,
  }) {
    return <String, dynamic>{
      'id': groupModel.id,
      'isAdmin': groupModel.isAdmin,
      'createAt': groupModel.createdAt,
    };
  }
}
