import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tangle/presentation/screens/onBoardingScreen/widgets/widgets.dart';

class Start extends StatelessWidget {
  final TabController tabController;
  const Start({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(
                  height: 200,
                  width: 200,
                  child: SvgPicture.asset("assets/couple.svg")),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Welcome to Arrow',
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'fakhhfdkahd fd fasnklfd dfsah fk dfsaghkhf  khasdkh fkasgh hf askhdk sakhk',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.grey, height: 1.8),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            children: [
              StepProgressIndicator(
                totalSteps: 6,
                currentStep: 1,
                selectedColor: Theme.of(context).primaryColor,
                unselectedColor: Theme.of(context).backgroundColor,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                tabController: tabController,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
