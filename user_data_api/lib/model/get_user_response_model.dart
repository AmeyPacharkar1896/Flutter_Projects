import 'dart:convert';

import 'package:user_data_api/model/user_model.dart';

class GetUserResponseModel {
  const GetUserResponseModel({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  factory GetUserResponseModel.fromJson(String jsonString) {
    return GetUserResponseModel.fromMap(
      json.decode(jsonString) as Map<String, dynamic>,
    );
  }

  factory GetUserResponseModel.fromMap(Map<String, dynamic> map) {
    return GetUserResponseModel(
      page: map['page'] as int,
      perPage: map['per_page'] as int,
      total: map['total'] as int,
      totalPages: map['total_pages'] as int,
      data: (map['data'] as List)
          .map((userMap) => UserModel.fromMap(userMap))
          .toList(),
    );
  }

  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<UserModel> data;
}