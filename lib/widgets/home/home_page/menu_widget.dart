import 'package:flutter/material.dart';
import 'package:lft_new_project/common/utils/sizes.dart';

import '../../../common/widgets/padding.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddingWidget(
      horizontal: CommonSizes.paddingWith,
      vertical: CommonSizes.paddingWith,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Image.asset('assets/img/menu.png'),
          ),
          // Container(
          //   height: 27.h,
          //   width: 27.w,
          //   decoration: const BoxDecoration(
          //       color: CommonColors.red, shape: BoxShape.circle),
          //   child: Icon(
          //     Icons.notifications_none_outlined,
          //     size: 22.w,
          //     color: CommonColors.white,
          //   ),
          // )
        ],
      ),
    );
  }
}
