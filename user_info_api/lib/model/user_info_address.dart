import 'dart:convert';

import 'package:user_data_api/model/user_info_geo.dart';

class UserInfoAddress {
  const UserInfoAddress({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory UserInfoAddress.fromJson(String jsonString) {
    return UserInfoAddress.fromMap(
      json.decode(jsonString) as Map<String, dynamic>,
    );
  }

  factory UserInfoAddress.fromMap(Map<String, dynamic> map) {
    return UserInfoAddress(
        street: map['street'] as String,
        suite: map['suite'] as String,
        city: map['city'] as String,
        zipcode: map['zipcode'] as String,
        geo: (map['geo'] as List<dynamic>)
            .map(
                (geoMap) => UserInfoGeo.fromJson(geoMap))
            .toList());
  }

  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final List<UserInfoGeo> geo;
}
