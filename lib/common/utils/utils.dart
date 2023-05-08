import 'package:flutter/material.dart';

void showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        textAlign: TextAlign.center,
      ),
    ),
  );

  // ThemeData themeData(BuildContext context) {
  //   return ThemeData(
  //     textTheme: TextTheme(
  //       headlineMedium:
  //           Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 15),
  //     ),
  //   );
  // }
}
