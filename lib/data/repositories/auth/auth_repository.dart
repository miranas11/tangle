import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:tangle/data/repositories/auth/base_auth_repository.dart';

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
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    // ignore: avoid_print
    print('Sign Out Succesfull');
  }

  @override
  Future<void> logInWithEmailandPassword({
    required String email,
    required String password,
  }) async {
    try {
      _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      // ignore: empty_catches
    } catch (e) {}
  }

  @override
  Stream<auth.User?> get user => _firebaseAuth.userChanges();
}
