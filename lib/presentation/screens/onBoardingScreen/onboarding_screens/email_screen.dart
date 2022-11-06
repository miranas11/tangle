// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bussiness/cubits/signup/signup_cubit.dart';
import '../widgets/widgets.dart';

class Email extends StatelessWidget {
  final TabController tabController;
  const Email({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextHeader(text: 'What\'s Your Email Address? '),
                  CustomTextField(
                    text: 'Enter Your Email',
                    onChanged: (value) {
                      context.read<SignupCubit>().emailChanged(value);
                      print(state.email);
                    },
                  ),
                  const SizedBox(height: 100),
                  const CustomTextHeader(
                    text: 'Choose a Password',
                  ),
                  CustomTextField(
                    text: 'Enter Your Password',
                    onChanged: (value) {
                      context.read<SignupCubit>().passwordChanged(value);
                      print(state.password);
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  StepProgressIndicator(
                    totalSteps: 6,
                    currentStep: 2,
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
      },
    );
  }
}
