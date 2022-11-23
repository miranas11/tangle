import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bussiness/blocs/blocs.dart';
import '../widgets/widgets.dart';

class Biography extends StatelessWidget {
  final TabController tabController;

  const Biography({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        if (state is OnboardingLoading) {
          return const Center(child: CircularProgressIndicator());
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
                    const CustomTextHeader(
                      text: 'Describe Yourself a Bit ',
                    ),
                    CustomTextField(
                      text: 'Enter Your Bio',
                      onChanged: (value) {
                        context.read<OnboardingBloc>().add(
                            UpdateUser(user: state.user.copyWith(bio: value)));
                      },
                    ),
                    const SizedBox(height: 100),
                    const CustomTextHeader(
                      text: 'What Do You Like?',
                    ),
                    Row(
                      children: const [
                        CustomTextContainer(text: 'Music'),
                        CustomTextContainer(text: 'Hiking'),
                        CustomTextContainer(text: 'Gaming'),
                        CustomTextContainer(text: 'Movies'),
                      ],
                    ),
                    Row(
                      children: const [
                        CustomTextContainer(text: 'Football'),
                        CustomTextContainer(text: 'Gym'),
                        CustomTextContainer(text: 'Trekking'),
                        CustomTextContainer(text: 'Art'),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    StepProgressIndicator(
                      totalSteps: 7,
                      currentStep: 6,
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
          return const Text('Something Went Wrong');
        }
      },
    );
  }
}
