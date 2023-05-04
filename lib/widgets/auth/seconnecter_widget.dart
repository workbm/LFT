import 'package:flutter/material.dart';

import '../../common/utils/colors.dart';
import '../../common/widgets/gap.dart';

class SeConnecterWidget extends StatelessWidget {
  const SeConnecterWidget({
    super.key,
    required this.text,
    required this.seConnecter,
    required this.changeTextColor,
  });
  final String text;
  final bool seConnecter;
  final bool changeTextColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: changeTextColor ? CommonColors.pink : CommonColors.black,
          ),
        ),
        const Gap(height: 7),
        Container(
          height: 2,
          width: 25,
          color: seConnecter ? CommonColors.darkGreen : Colors.transparent,
        )
      ],
    );
  }
}
