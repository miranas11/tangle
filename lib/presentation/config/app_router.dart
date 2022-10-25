import 'package:flutter/material.dart';
import 'package:tangle/data/models/models.dart';
import 'package:tangle/presentation/screens/screens.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      // case HomeScreen.routeName:
      //   return HomeScreen.route();
      case ChatScreen.routeName:
        return ChatScreen.route(userMatch: settings.arguments as UserMatch);
      case MatchesScreen.routeName:
        return MatchesScreen.route();
      case UserScreen.routeName:
        return UserScreen.route(user: settings.arguments as User);
      case OnBoardingScreen.routeName:
        return OnBoardingScreen.route();
      default:
        return _errorRoute();
    }
  }

  Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error Page'),
        ),
      ),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
