import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:jkb_firebase_chat/modules/auth/model/user_model.dart';
class SearchUserFirestoreService {
  final _firestore = FirebaseFirestore.instance;

  Future<Either<Exception, List<UserModel>>> searchUser({required String query}) async {
    try {
      final result = await _firestore
          .collection('users')
          .where('name', arrayContains: query)
          .get();

      final users = result.docs.map((doc) => UserModel.fromMap(doc.data())).toList();
      return Right(users);
    } catch (e) {
      return Left(Exception('Failed to fetch users'));
    }
  }
}
