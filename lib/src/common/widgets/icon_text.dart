import 'package:flutter/material.dart';

import '../assets/colors.gen.dart';
import '../resource/fonts.dart';
import 'story_owner.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool? hasAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(14),
          child: CircleIcon(
            width: 48,
            height: 48,
            icon: icon,
          ),
        ),
        Text(
          text,
          style: primaryTextStyle(
              color: ColorName.white,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        const Spacer(),
        if (hasAction == true)
         const  Icon(
            Icons.chevron_right,
            color: ColorName.white,
          ),
        if (hasAction == true)
          const Padding(
            padding: EdgeInsets.only(right: 24),
          ),
      ],
    );
  }

  const IconText({
    super.key,
    required this.icon,
    this.hasAction = false,
    required this.text,
  });
}
