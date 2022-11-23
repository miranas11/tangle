part of 'onboarding_bloc.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object?> get props => [];
}

class StartOnBoarding extends OnboardingEvent {
  final User user;

  const StartOnBoarding({
    this.user = const User(
      id: '',
      name: '',
      age: 0,
      bio: '',
      gender: '',
      imageUrls: [],
      interests: [],
      jobTitle: '',
      location: '',
    ),
  });

  @override
  List<Object?> get props => [user];
}

class UpdateUser extends OnboardingEvent {
  final User user;

  const UpdateUser({required this.user});

  @override
  List<Object?> get props => [user];
}

class UpdateUserImages extends OnboardingEvent {
  final User? user;
  final XFile image;

  const UpdateUserImages({this.user, required this.image});

  @override
  List<Object?> get props => [user, image];
}
