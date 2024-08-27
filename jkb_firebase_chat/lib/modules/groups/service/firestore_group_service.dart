import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jkb_firebase_chat/core/util/fire_store_collection.dart';
import 'package:jkb_firebase_chat/modules/auth/model/user_model.dart';

class FirestoreGroupService {
  final _client = FirebaseFirestore.instance;

  void createGroupChat({
    required UserModel admin,
  }) {
    final ref =
        _client.collection(FirestoreCollections.groupChat).doc();
  }
}
