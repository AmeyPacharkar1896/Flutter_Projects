import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:jkb_firebase_chat/modules/auth/model/user_model.dart';

class AuthFirestoreService {
  final _client = FirebaseFirestore.instance;

  Future<Either<String, void>> createUser({
    required UserModel userModel,
  }) async {
    try {
      final ref = _client.collection('users').doc(userModel.id);
      return Right(await ref.set(userModel.toMap()));
    } catch (e) {
      log(e.toString());
      return const Left('Something went wrong!');
    }
  }
}