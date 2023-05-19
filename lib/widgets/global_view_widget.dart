import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lft_new_project/widgets/home/home_page/activity/activity_widget.dart';

import '../../../../common/widgets/gap.dart';
import '../../../../common/widgets/padding.dart';
import '../common/utils/colors.dart';
import '../common/widgets/horizontal_gap.dart';

class GlobalViewWidget extends StatelessWidget {
  const GlobalViewWidget(
      {super.key, required this.title, required this.subTitle});
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PaddingWidget(
          horizontal: size.width * 0.04,
          vertical: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.amber,
                    width: 210.w,
                    child: AutoSizeText(
                      subTitle,
                      maxLines: 2,
                      maxFontSize: 12,
                      style: const TextStyle(color: CommonColors.textGrey),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        'Voir plus',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: CommonColors.red),
                        maxLines: 1,
                      ),
                      const HorizontalGap(width: 4),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        // size: size.width * 0.07,
                        color: CommonColors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const Gap(height: 15),
        const ActivityWidget(),
      ],
    );
  }
}
