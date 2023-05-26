import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lft_new_project/provider/profile/agenda_event_provider.dart';
import 'package:provider/provider.dart';

import '../../../common/utils/colors.dart';
import '../../../common/widgets/gap.dart';
import '../../../common/widgets/horizontal_gap.dart';
import '../../../common/widgets/likes_widget.dart';

class EventSnippet extends StatelessWidget {
  const EventSnippet({super.key});

  @override
  Widget build(BuildContext context) {
    var listenData = context.watch<AgendaEventProvider>();
    return Container(
      decoration: BoxDecoration(
          color: CommonColors.white,
          boxShadow: [
            BoxShadow(
              color: CommonColors.backgroundColor.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 7.w),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.yellow,
                width: 203.w,
                height: 30.h,
                child: AutoSizeText(
                  listenData.events[0].name,
                  // listenData.activities[index].name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const Gap(height: 5),
              Container(
                color: Colors.teal,
                width: 203.w,
                height: 30.h,
                child: AutoSizeText(
                  'serviceModel.description',
                  // listenData.activities[index].description,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              const Gap(height: 5),
              Container(
                width: 203.w,
                color: Colors.orange,
                child: Row(
                  children: [
                    const LikesCommentWidget(
                      containerHeight: 20,
                      containerWidth: 45,
                      horizontalPadding: 2,
                      imageSize: 17,
                      isIcon: false,
                      textContainer: 18,
                    ),
                    SizedBox(width: 3.w),
                    const LikesCommentWidget(
                      containerHeight: 20,
                      containerWidth: 45,
                      horizontalPadding: 2,
                      imageSize: 17,
                      isIcon: true,
                      textContainer: 18,
                    ),
                    const Spacer(),
                    const HorizontalGap(width: 3),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
