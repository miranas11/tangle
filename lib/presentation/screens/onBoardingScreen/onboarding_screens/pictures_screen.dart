import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tangle/data/models/models.dart';
import '../widgets/widgets.dart';
import 'package:tangle/bussiness/blocs/blocs.dart';

class Pictures extends StatelessWidget {
  final TabController tabController;
  const Pictures({
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
          var images = state.user.imageUrls;
          var imagesCount = images.length;
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
                      text: 'Add 2 or More Pictures',
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 350,
                      child: GridView.builder(
                        itemCount: 6,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, childAspectRatio: 0.66),
                        itemBuilder: ((context, index) {
                          return (imagesCount > index)
                              ? CustomImageContainer(imageUrl: images[index])
                              : const CustomImageContainer();
                        }),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    StepProgressIndicator(
                      totalSteps: 7,
                      currentStep: 5,
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
          return const Center(
            child: Text('SOMETHING WENT WRONG'),
          );
        }
      },
    );
  }
}

Future<User> getdoc() async {
  return await FirebaseFirestore.instance
      .collection('users')
      .doc('Oh32yem00h1i57R7rPjG')
      .get()
      .then((value) => User?.fromSnapshot(value));
}
