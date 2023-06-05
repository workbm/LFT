import 'package:flutter/material.dart';
import 'package:lft_new_project/common/utils/colors.dart';
import 'package:lft_new_project/screens/auth/login.dart';

class SkipeWidget extends StatelessWidget {
  const SkipeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Login.routeName);
          },
          child: const Text(
            'Skipe',
            style: TextStyle(
              color: CommonColors.blueWildYonder,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
