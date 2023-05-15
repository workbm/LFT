import 'package:flutter/material.dart';

class PaddingWidget extends StatelessWidget {
  const PaddingWidget({
    super.key,
    required this.horizontal,
    required this.vertical,
    required this.child,
  });
  final double horizontal;
  final double vertical;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(horizontal, vertical, horizontal, 0),
      child: child,
    );
  }
}
