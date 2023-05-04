import 'package:flutter/material.dart';
import 'package:lft_new_project/common/utils/colors.dart';

class SkipeWidget extends StatelessWidget {
  const SkipeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        Text(
          'Skipe',
          style: TextStyle(
            color: CommonColors.lightBlue,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
