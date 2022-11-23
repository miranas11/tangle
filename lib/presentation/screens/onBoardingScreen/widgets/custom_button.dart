import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:tangle/bussiness/blocs/blocs.dart';
import 'package:tangle/bussiness/cubits/signup/signup_cubit.dart';
import 'package:tangle/data/models/models.dart';

class CustomButton extends StatelessWidget {
  final TabController tabController;
  final String text;

  const CustomButton({
    Key? key,
    required this.tabController,
    this.text = 'START',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).primaryColor,
              ],
            ),
            borderRadius: BorderRadius.circular(15)),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent, elevation: 0),
          onPressed: () async {
            if (tabController.index == 1) {
              await context.read<SignupCubit>().signUpWithCredentials();
              User user = User(
                id: context.read<SignupCubit>().state.user!.uid,
                name: '',
                age: 0,
                imageUrls: const [],
                bio: '',
                jobTitle: '',
                gender: '',
                location: '',
                interests: const [],
              );
              print('Inside Cutom Button in Email Screen');
              context.read<OnboardingBloc>().add(StartOnBoarding(user: user));
            }

            tabController.animateTo(tabController.index + 1);
          },
          child: SizedBox(
            width: double.infinity,
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
