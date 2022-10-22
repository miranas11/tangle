import 'package:flutter/material.dart';
import 'package:tangle/data/models/models.dart';
import 'package:tangle/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          UserCard(
            user: User.users[1],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ChoiceButton(
                  height: 60,
                  width: 60,
                  size: 25,
                  icon: Icons.clear_rounded,
                  color: Theme.of(context).colorScheme.secondary,
                  hasGradient: false,
                ),
                const ChoiceButton(
                  height: 80,
                  width: 80,
                  size: 30,
                  icon: Icons.favorite,
                  color: Colors.white,
                  hasGradient: true,
                ),
                ChoiceButton(
                  height: 60,
                  width: 60,
                  size: 25,
                  icon: Icons.watch_later,
                  color: Theme.of(context).primaryColor,
                  hasGradient: false,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ChoiceButton extends StatelessWidget {
  const ChoiceButton(
      {Key? key,
      required this.height,
      required this.width,
      required this.size,
      required this.color,
      required this.icon,
      required this.hasGradient})
      : super(key: key);

  final double width;
  final double height;
  final Color color;
  final double size;
  final IconData icon;
  final bool hasGradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          gradient: hasGradient
              ? LinearGradient(colors: [
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).primaryColor,
                ])
              : const LinearGradient(colors: [
                  Colors.white,
                  Colors.white,
                ]),
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(50),
              blurRadius: 2,
              spreadRadius: 4,
            ),
          ]),
      child: Icon(
        icon,
        color: color,
        size: size,
      ),
    );
  }
}
