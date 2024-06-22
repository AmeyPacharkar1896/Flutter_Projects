import 'dart:convert';

class UserInfoGeo {
  const UserInfoGeo({
    required this.lat,
    required this.lng,
  });

  factory UserInfoGeo.fromJson(String jsonString) {
    return UserInfoGeo.fromMap(
      json.decode(jsonString) as Map<String, dynamic>,
    );
  }
  factory UserInfoGeo.fromMap(Map<String, dynamic> map) {
    return UserInfoGeo(
      lat: map['lat'] as String,
      lng: map['lng'] as String,
    );
  }

  final String lat;
  final String lng;
}