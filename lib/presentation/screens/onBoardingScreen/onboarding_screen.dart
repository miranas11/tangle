import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tangle/bussiness/cubits/signup/signup_cubit.dart';
import 'package:tangle/data/repositories/auth_repository.dart';
import 'package:tangle/presentation/widgets/widgets.dart';
import 'onboarding_screens/screens.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  static const String routeName = '/onBoarding';

  static Route route() {
    return MaterialPageRoute(
      builder: ((context) => BlocProvider(
            create: (_) => SignupCubit(
              authRepository: context.read<AuthRepository>(),
            ),
            child: const OnBoardingScreen(),
          )),
      settings: const RouteSettings(name: routeName),
    );
  }

  static const List<Tab> tabs = <Tab>[
    Tab(text: 'Start'),
    Tab(text: 'Email'),
    Tab(text: 'Email Verification'),
    Tab(text: 'Demo'),
    Tab(text: 'Pictures'),
    Tab(text: 'Biography'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(
        builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context)!;
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {}
          });
          return Scaffold(
            appBar: const CustomAppBar(
              title: 'OnBoarding',
              hasActions: false,
            ),
            body: TabBarView(
              children: [
                Start(tabController: tabController),
                Email(tabController: tabController),
                EmailVerification(tabController: tabController),
                Demographics(tabController: tabController),
                Pictures(tabController: tabController),
                Biography(tabController: tabController),
              ],
            ),
          );
        },
      ),
    );
  }
}
