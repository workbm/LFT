import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({
    super.key,
    required this.firstColor,
    required this.secondColor,
    required this.thirdColor,
  });
  final Color firstColor;
  final Color secondColor;
  final Color thirdColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 7,
          backgroundColor: firstColor,
        ),
        const SizedBox(
          width: 5,
        ),
        CircleAvatar(
          radius: 7,
          backgroundColor: secondColor,
        ),
        const SizedBox(
          width: 5,
        ),
        CircleAvatar(
          radius: 7,
          backgroundColor: thirdColor,
        ),
      ],
    );
  }
}
