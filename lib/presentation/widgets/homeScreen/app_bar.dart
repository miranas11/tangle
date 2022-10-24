import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    this.hasActions = true,
    Key? key,
  }) : super(key: key);

  final String title;
  final bool hasActions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          Expanded(
            flex: 1,
            child: SvgPicture.asset(
              'assets/logo.svg',
              height: 40,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ],
      ),
      actions: hasActions
          ? [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.message),
                  color: Theme.of(context).primaryColor),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person),
                color: Theme.of(context).primaryColor,
              )
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
