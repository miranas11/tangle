import 'package:firebase_auth/firebase_auth.dart' as auth;

abstract class BaseAuthRepository {
  Future<auth.User?> signUp({required String email, required String password});

  Stream<auth.User?> get user;
}
