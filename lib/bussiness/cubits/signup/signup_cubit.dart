import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/auth/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository _authRepository;
  SignupCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(SignupState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value));
  }

  Future<void> signUpWithCredentials() async {
    if (!state.isValid) return;
    try {
      var user = await _authRepository.signUp(
          email: state.email, password: state.password);
      emit(
        state.copyWith(status: SignUpStatus.success, user: user),
      );
      // ignore: avoid_print
      print('User Created');
      // ignore: empty_catches
    } catch (e) {}
  }
}
