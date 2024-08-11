import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFireBaseService {
  final _client = FirebaseAuth.instance;

  Future<Either<String, UserCredential>> createAccount({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final response = await _client.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return Right(response);
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
      return Left(e.message ?? 'Something went wrong!');
    }
  }

  Future<Either<String, UserCredential>> login({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final response = await _client.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return Right(response);
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
      return Left(e.message ?? 'Something went wrong!');
    }
  }

  Future<Either<String, void>> logout() async {
    try {
      final response = await _client.signOut();
      return Right(response);
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
      return Left(e.message ?? 'Something went wrong!');
    }
  }
}
