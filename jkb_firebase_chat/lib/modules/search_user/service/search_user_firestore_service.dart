import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:jkb_firebase_chat/modules/auth/model/user_model.dart';

class SearchUserFirestoreService {
  final _firestore = FirebaseFirestore.instance;

  Future<Either<String, List<UserModel>>> searchUser(
      {required String query}) async {
    try {
      final result = await _firestore
          .collection('users')
          .where('name', isGreaterThanOrEqualTo: query)
          .get();

      final users =
          result.docs.map((doc) => UserModel.fromMap(doc.data())).toList();
      return Right(users);
    } catch (e) {
      log(e.toString());
      return Left(e.toString());
    }
  }
}
