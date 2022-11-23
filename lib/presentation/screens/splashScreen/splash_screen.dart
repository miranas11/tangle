import 'dart:async';

import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tangle/bussiness/blocs/blocs.dart';
import 'package:tangle/presentation/screens/homeScreen/home_screen.dart';
import 'package:tangle/presentation/screens/onBoardingScreen/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.unauthenticated ||
              state.status == AuthStatus.unknown) {
            Timer(
                const Duration(seconds: 1),
                () => Navigator.of(context).pushNamedAndRemoveUntil(
                      OnBoardingScreen.routeName,
                      ModalRoute.withName('/onboarding'),
                    ));
          } else if (state.status == AuthStatus.authenticated) {
            Timer(
              const Duration(seconds: 1),
              () => Navigator.of(context).pushNamed(HomeScreen.routeName),
            );
          }
        },
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/logo.svg',
                  height: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'ARROW',
                  style: Theme.of(context).textTheme.headline1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
