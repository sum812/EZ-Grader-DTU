import 'package:flutter/material.dart';

import 'home_widget.dart';

class RowHomeWidget extends StatelessWidget {
  const RowHomeWidget({
    super.key,
    required this.size,
    required this.title1,
    required this.subTitle1,
    required this.iconData1,
    required this.onTap1,
    required this.title2,
    required this.subTitle2,
    required this.iconData2,
    required this.onTap2,
  });

  final Size size;
  final String title1, title2;
  final String subTitle1, subTitle2;
  final IconData iconData1, iconData2;
  final VoidCallback? onTap1, onTap2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomeWidget(
          size: size,
          icon: iconData1,
          title: title1,
          subtitle:
          subTitle1,
          onTap: onTap1,
        ),
        HomeWidget(
          size: size,
          icon: iconData2,
          title: title2,
          subtitle:
          subTitle2,
          onTap: onTap2,
        ),
      ],
    );
  }
}
