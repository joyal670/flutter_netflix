import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final IconData iconData;
  final String title;
  final double iconSize;
  final double titleSize;
  const CustomButtonWidget({
    super.key,
    required this.iconData,
    required this.title,
    this.iconSize = 30,
    this.titleSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          iconData,
          color: colorWhite,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(
            color: colorWhite,
            fontSize: titleSize,
          ),
        )
      ],
    );
  }
}
