import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});
  static const routeName = '/screen-3';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(
        'assets/img/Scroll-2.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
