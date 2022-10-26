import 'package:flutter/material.dart';

class CustomImageContainer extends StatelessWidget {
  final TabController tabController;
  const CustomImageContainer({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 10),
      child: Container(
        height: 130,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border(
            top: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1,
            ),
            bottom: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1,
            ),
            left: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1,
            ),
            right: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1,
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
            alignment: Alignment.bottomRight,
            icon: Icon(
              Icons.add_circle,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
