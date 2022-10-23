import 'package:flutter/material.dart';

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
