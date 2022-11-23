part of 'signup_cubit.dart';

enum SignUpStatus { initial, submitting, success, error }

class SignupState extends Equatable {
  final String email;
  final String password;
  final SignUpStatus status;
  final auth.User? user;

  const SignupState({
    required this.email,
    required this.password,
    required this.status,
    this.user,
  });

  factory SignupState.initial() {
    return const SignupState(
      email: '',
      password: '',
      status: SignUpStatus.initial,
      user: null,
    );
  }

  SignupState copyWith({
    String? email,
    String? password,
    SignUpStatus? status,
    auth.User? user,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  bool get isValid => email.isNotEmpty && password.isNotEmpty;

  @override
  List<Object?> get props => [email, password, status, user];
}
