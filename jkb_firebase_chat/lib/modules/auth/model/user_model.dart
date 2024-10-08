import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  const UserModel({
    required this.id,
    this.name,
    this.email,
  });

  final String id;
  final String? name;
  final String? email;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      id: user.uid,
      name: user.displayName,
      email: user.email,
    );
  }

  factory UserModel.placeholder() {
    return const UserModel(
      id: '', 
      name: 'Unknown User',
      email: '',
    );
  }
}
