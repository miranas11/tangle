import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class EmailVerification extends StatelessWidget {
  final TabController tabController;
  const EmailVerification({
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
        children: [
          Column(
            children: [
              const CustomTextHeader(
                  text: 'Did You Get The Verification Code? '),
              CustomTextField(text: 'Enter The Code', controller: controller),
            ],
          ),
          Column(
            children: [
              StepProgressIndicator(
                totalSteps: 6,
                currentStep: 3,
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
