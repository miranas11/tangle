import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:tangle/data/repositories/base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  final auth.FirebaseAuth _firebaseAuth;

  AuthRepository({auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  @override
  Future<auth.User?> signUp(
      {required String email, required String password}) async {
    try {
      final credentials = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = credentials.user;
      return user;
    } catch (_) {}
    return null;
  }

  @override
  Stream<auth.User?> get user => _firebaseAuth.userChanges();
}
