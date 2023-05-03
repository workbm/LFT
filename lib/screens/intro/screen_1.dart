import 'package:flutter/material.dart';
import 'package:lft_new_project/screens/intro/screen_3.dart';

import 'screen_2.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});
  static const routeName = '/screen-1';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity == 0) return;

        if (details.primaryVelocity!.compareTo(0) == -1) {
          Navigator.pushNamed(context, Screen3.routeName);
        } else {
          Navigator.pushNamed(context, Screen2.routeName);
        }
      },
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Image.asset(
          'assets/img/Scroll.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
