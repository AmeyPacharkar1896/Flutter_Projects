import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<String?> registration({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'week-password') {
        return 'The password is too week';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email';
      } else {
        e.message;
      }
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for the email';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for the user';
      } else {
        return e.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }
}
