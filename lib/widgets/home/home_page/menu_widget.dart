import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lft_new_project/common/utils/sizes.dart';
import 'package:lft_new_project/common/widgets/horizontal_gap.dart';

import '../../../common/utils/colors.dart';
import '../../../common/widgets/padding.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key, required this.isMenu});
  final bool isMenu;
  @override
  Widget build(BuildContext context) {
    return PaddingWidget(
      horizontal: CommonSizes.paddingWith,
      vertical: CommonSizes.paddingWith,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if (isMenu) {
                Scaffold.of(context).openDrawer();
              } else {
                Navigator.of(context).pop();
              }
            },
            child: Container(
              color: Colors.transparent,
              height: 37.h,
              width: 45.w,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  isMenu
                      ? Image.asset(
                          'assets/img/menu.png',
                        )
                      : const Icon(Icons.arrow_back),
                ],
              ),
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.search,
            color: CommonColors.darkGrey,
          ),
          const HorizontalGap(width: 5),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 37.h,
                width: 37.w,
              ),
              Container(
                height: 30.h,
                width: 30.w,
                decoration: const BoxDecoration(
                    color: CommonColors.red, shape: BoxShape.circle),
                child: Icon(
                  Icons.notifications_none_outlined,
                  size: 22.w,
                  color: CommonColors.white,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: CommonColors.black,
                  ),
                  child: const Text(
                    '3',
                    style: TextStyle(
                      color: CommonColors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
