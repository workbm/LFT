import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/utils/colors.dart';

class RemiseGlobalWidget extends StatefulWidget {
  const RemiseGlobalWidget({super.key, required this.remise});
  final String remise;

  @override
  State<RemiseGlobalWidget> createState() => _RemiseGlobalWidgetState();
}

class _RemiseGlobalWidgetState extends State<RemiseGlobalWidget> {
  // ignore: prefer_final_fields
  var _pressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          print('Pressed');
          _pressed = !_pressed;
        });
      },
      child: Container(
        height: 20.h,
        width: 50.w,
        decoration: const BoxDecoration(
          color: CommonColors.red,
          borderRadius: BorderRadius.all(Radius.circular(3)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
        child: Center(
          child: !_pressed
              ? const AutoSizeText(
                  'Promo',
                  minFontSize: 8,
                  maxLines: 1,
                  style: TextStyle(
                    color: CommonColors.white,
                  ),
                )
              : AutoSizeText(
                  '${widget.remise}%',
                  minFontSize: 8,
                  maxLines: 1,
                  style: const TextStyle(
                    color: CommonColors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
