import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

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
              'Tangle',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message),
            color: Theme.of(context).primaryColor),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.person),
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
