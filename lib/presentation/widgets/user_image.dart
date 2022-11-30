import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserImage extends StatelessWidget {
  final String? url;
  final double height;
  final double width;
  final EdgeInsets? margin;
  final List<BoxShadow>? boxShadow;
  final BoxBorder? boxBorder;
  final BoxBorder? border;
  final Widget? child;

  const UserImage.medium(
      {super.key,
      this.url,
      this.height = 200,
      this.width = double.infinity,
      this.margin,
      this.boxShadow,
      this.boxBorder,
      this.border,
      this.child});

  const UserImage.small(
      {super.key,
      this.url,
      this.height = 60,
      this.width = 60,
      this.margin,
      this.boxShadow,
      this.boxBorder,
      this.border,
      this.child});

  const UserImage.large(
      {super.key,
      this.url,
      required this.height,
      required this.width,
      this.margin,
      this.boxShadow,
      this.boxBorder,
      this.border,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: (url == null)
              ? const AssetImage('assets/placeholder-image.png')
                  as ImageProvider
              : NetworkImage(url!),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: border,
        boxShadow: boxShadow,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
