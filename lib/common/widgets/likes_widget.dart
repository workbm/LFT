import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class LikesWidget extends StatelessWidget {
  const LikesWidget({
    super.key,
    required this.containerWidth,
    required this.containerHeight,
    required this.horizontalPadding,
    required this.imageSize,
    required this.isIcon,
    required this.textContainer,
  });
  final double containerWidth,
      containerHeight,
      horizontalPadding,
      imageSize,
      textContainer;
  final bool isIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth.w,
      height: containerHeight.h,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
      decoration: const BoxDecoration(
          color: CommonColors.backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          )),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              child: isIcon
                  ? Icon(
                      Icons.favorite_border,
                      color: CommonColors.red,
                      size: imageSize.w,
                    )
                  : Image.asset(
                      'assets/img/comment.png',
                      height: imageSize.h,
                      width: imageSize.w,
                    ),
            ),
            const Spacer(),
            SizedBox(
              width: textContainer.w,
              child: const AutoSizeText(
                '5.2k',
                maxLines: 1,
                minFontSize: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
