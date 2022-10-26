import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class Demographics extends StatelessWidget {
  final TabController tabController;
  const Demographics({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
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
              const CustomCheckBox(text: 'MALE'),
              const CustomCheckBox(text: 'FEMALE'),
              const SizedBox(height: 100),
              const CustomTextHeader(text: 'What\'s Your Age? '),
              CustomTextField(text: 'Enter Your Age?', controller: controller),
            ],
          ),
          Column(
            children: [
              StepProgressIndicator(
                totalSteps: 6,
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
  }
}
