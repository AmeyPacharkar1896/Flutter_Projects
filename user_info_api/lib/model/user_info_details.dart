import 'dart:convert';
import 'dart:developer';

import 'package:user_data_api/model/user_info_address.dart';

class UserInfoDetails {
  const UserInfoDetails({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
  });

  factory UserInfoDetails.fromJson(String jsonString) {
    return UserInfoDetails.fromList(
      json.decode(jsonString) as List<dynamic>,
    );
  }

  factory UserInfoDetails.fromList(List<dynamic> list) {
    List<UserInfoDetails> listOfUsers = [];
    for (Map<String, dynamic> user in list) {
      log(user.toString());
      listOfUsers.add(UserInfoDetails.fromMap(user));
    }
    return listOfUsers;
  }

  factory UserInfoDetails.fromMap(Map<String, dynamic> map) {
    return UserInfoDetails(
      id: map['page'] as int,
      name: map['per_page'] as String,
      username: map['total'] as String,
      email: map['total_pages'] as String,
      address: (map['data'] as List)
          .map((userMap) => UserInfoAddress.fromJson(userMap))
          .toList(),
    );
  }

  final int id;
  final String name;
  final String username;
  final String email;
  final List<UserInfoAddress> address;
}