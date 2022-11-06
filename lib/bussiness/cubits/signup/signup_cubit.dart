// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tangle/data/repositories/auth_repository.dart';

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

  void signUpWithCredentials() async {
    if (!state.isValid) return;
    try {
      await _authRepository.signUp(
          email: state.email, password: state.password);
      emit(
        state.copyWith(status: SignUpStatus.success),
      );
    } catch (e) {}
  }
}
