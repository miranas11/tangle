import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bussiness/blocs/blocs.dart';
import '../widgets/widgets.dart';

//For you gender and age

class Demographics extends StatelessWidget {
  final TabController tabController;
  const Demographics({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        if (state is OnboardingLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is OnboardingLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextHeader(text: 'What\'s Your Gender? '),
                    const SizedBox(height: 10),
                    CustomCheckBox(
                      text: 'MALE',
                      value: state.user.gender == 'Male',
                      onChanged: (bool? newValue) {
                        context.read<OnboardingBloc>().add(
                              UpdateUser(
                                  user: state.user.copyWith(gender: 'Male')),
                            );
                      },
                    ),
                    CustomCheckBox(
                      text: 'FEMALE',
                      value: state.user.gender == 'Female',
                      onChanged: (bool? value) {
                        context.read<OnboardingBloc>().add(
                              UpdateUser(
                                  user: state.user.copyWith(gender: 'Female')),
                            );
                      },
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    const CustomTextHeader(text: 'What\'s Your Age? '),
                    CustomTextField(
                      text: 'Enter Your Age?',
                      onChanged: (age) {
                        context.read<OnboardingBloc>().add(UpdateUser(
                            user: state.user.copyWith(age: int.parse(age))));
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    StepProgressIndicator(
                      totalSteps: 7,
                      currentStep: 4,
                      selectedColor: Theme.of(context).primaryColor,
                      unselectedColor: Theme.of(context).backgroundColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      tabController: tabController,
                      text: 'NEXT STEP',
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return const Center(child: Text('Something Went Wrong!'));
        }
      },
    );
  }
}
