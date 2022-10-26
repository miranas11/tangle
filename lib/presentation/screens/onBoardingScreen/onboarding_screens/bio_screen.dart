import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class Biography extends StatelessWidget {
  final TabController tabController;

  const Biography({
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
              const CustomTextHeader(
                text: 'Describe Yourself a Bit ',
              ),
              CustomTextField(
                text: 'Enter Your Bio',
                controller: controller,
              ),
              const SizedBox(height: 100),
              const CustomTextHeader(
                text: 'What Do You Like?',
              ),
              Row(
                children: [
                  CustomTextContainer(
                      tabController: tabController, text: 'Music'),
                  CustomTextContainer(
                      tabController: tabController, text: 'Hiking'),
                  CustomTextContainer(
                      tabController: tabController, text: 'Gaming'),
                  CustomTextContainer(
                      tabController: tabController, text: 'Movies'),
                ],
              ),
              Row(
                children: [
                  CustomTextContainer(
                      tabController: tabController, text: 'Football'),
                  CustomTextContainer(
                      tabController: tabController, text: 'Gym'),
                  CustomTextContainer(
                      tabController: tabController, text: 'Trekking'),
                  CustomTextContainer(
                      tabController: tabController, text: 'Art'),
                ],
              ),
            ],
          ),
          Column(
            children: [
              StepProgressIndicator(
                totalSteps: 6,
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
  }
}
