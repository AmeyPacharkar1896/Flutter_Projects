class GroupModel {
  GroupModel({
    required this.id,
    required this.adminName,
    required this.adminId,
    required this.createdAt,
  });

  final String id;
  final String adminName;
  final String adminId;
  final DateTime createdAt;

  GroupModel copyWith({
    String? id,
    String? adminName,
    String? adminId,
    DateTime? createdAt,
  }) {
    return GroupModel(
      id: id ?? this.id,
      adminName: adminName ?? this.adminName,
      adminId: adminId ?? this.adminId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap({
    required GroupModel groupModel,
  }) {
    return <String, dynamic> {
      'id': groupModel.id,
      'adminName': groupModel.adminName,
      'adminId': groupModel.adminId,
      'createdAt': groupModel.createdAt.millisecondsSinceEpoch,
    };
  }
}
