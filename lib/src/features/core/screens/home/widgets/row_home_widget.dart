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
    this.title2,
    this.subTitle2,
    this.iconData2,
    this.onTap2,
    this.endWidget = true,
  });

  final Size size;
  final String title1;
  final String? title2;
  final String subTitle1;
  final String? subTitle2;
  final IconData iconData1;
  final IconData? iconData2;
  final VoidCallback? onTap1, onTap2;
  final bool endWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomeWidget(
          size: size,
          icon: iconData1,
          title: title1,
          subtitle: subTitle1,
          onTap: onTap1,
        ),
        if (endWidget == true && title2 != null && subTitle2 != null && iconData2 != null)
          HomeWidget(
            size: size,
            icon: iconData2!,
            title: title2!,
            subtitle: subTitle2!,
            onTap: onTap2,
          ),
      ],
    );
  }
}
