import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lft_new_project/models/event_model.dart';

import '../../../common/utils/colors.dart';
import '../../../common/utils/sizes.dart';
import '../../../common/widgets/gap.dart';
import '../../../common/widgets/horizontal_gap.dart';
import '../../../common/widgets/likes_widget.dart';

class EventSnippet extends StatelessWidget {
  const EventSnippet({super.key, required this.event});
  final EventModel event;
  @override
  Widget build(BuildContext context) {
    // var listenData = context.watch<AgendaEventProvider>();
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
      margin: EdgeInsets.only(
          bottom: 10,
          right: CommonSizes.paddingWith,
          left: CommonSizes.paddingWith),
      child: Row(
        children: [
          Container(
            height: 100.h,
            width: 100.w,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                    // 'https://image.cnbcfm.com/api/v1/image/107237975-1683618281463-gettyimages-1246198060-20221229_bath_golf_course_views_007.jpeg?v=1683629943&w=630&h=354&ffmt=webp&vtcrop=y',
                    // listenData.activities[index].images[i].url,
                    'https://i0.wp.com/thegoodlifefrance.com/wp-content/uploads/2018/01/nice-carnival.jpg?ssl=1'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const HorizontalGap(width: 7),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                // color: Colors.yellow,
                width: 203.w,
                height: 30.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      // color: Colors.blueAccent,
                      width: 170.w,
                      height: 30.h,
                      child: AutoSizeText(
                        event.name,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    Icon(Icons.bookmark_outline, size: 20.w),
                  ],
                ),
              ),
              const Gap(height: 5),
              SizedBox(
                // color: Colors.teal,
                width: 203.w,
                height: 30.h,
                child: AutoSizeText(
                  event.description,
                  // style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              const Gap(height: 5),
              SizedBox(
                width: 203.w,
                // color: Colors.orange,
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
                    // const Spacer(),
                    // !listenData.services[index].haveDiscount
                    //     ? const SizedBox()
                    //     : Container(
                    //         height: 20.h,
                    //         width: 50.w,
                    //         decoration: const BoxDecoration(
                    //           color: CommonColors.red,
                    //           borderRadius:
                    //               BorderRadius.all(Radius.circular(3)),
                    //         ),
                    //         padding: EdgeInsets.symmetric(
                    //             horizontal: 1.w, vertical: 2.h),
                    //         child: Center(
                    //           child: AutoSizeText(
                    //             listenData.services[index].remise
                    //                 .toString(),
                    //             minFontSize: 8,
                    //             maxLines: 1,
                    //             style: const TextStyle(
                    //               color: CommonColors.white,
                    //             ),
                    //           ),
                    //         ),
                    //       ),

                    // const HorizontalGap(width: 3),
                    const Spacer(),
                    Container(
                      height: 20.h,
                      width: 50.w,
                      decoration: const BoxDecoration(
                        color: CommonColors.lightTeal,
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
                      child: const Center(
                        child: AutoSizeText(
                          'Consulter',
                          minFontSize: 8,
                          maxLines: 1,
                          style: TextStyle(
                            color: CommonColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );

    // Container(
    //   decoration: BoxDecoration(
    //       color: CommonColors.white,
    //       boxShadow: [
    //         BoxShadow(
    //           color: CommonColors.backgroundColor.withOpacity(0.5),
    //           spreadRadius: 1,
    //           blurRadius: 5,
    //         ),
    //       ],
    //       borderRadius: const BorderRadius.all(Radius.circular(15))),
    //   padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 7.w),
    //   margin: EdgeInsets.only(bottom: 10.h),
    //   child: Row(
    //     children: [
    //       Column(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           SizedBox(
    //             // color: Colors.yellow,
    //             width: 300.w,
    //             // height: 30.h,
    //             child: AutoSizeText(
    //               event.name, // listenData.activities[index].name,
    //               style: Theme.of(context).textTheme.headlineMedium,
    //             ),
    //           ),
    //           const Gap(height: 10),
    //           SizedBox(
    //             // color: Colors.teal,
    //             width: 300.w,
    //             // height: 30.h,
    //             child: AutoSizeText(
    //               event
    //                   .description, // listenData.activities[index].description,
    //               // style: Theme.of(context).textTheme.bodySmall,
    //             ),
    //           ),
    //           const Gap(height: 10),

    //           // Container(
    //           //   width: 203.w,
    //           //   color: Colors.orange,
    //           //   child: Row(
    //           //     children: [
    //           //       const LikesCommentWidget(
    //           //         containerHeight: 20,
    //           //         containerWidth: 45,
    //           //         horizontalPadding: 2,
    //           //         imageSize: 17,
    //           //         isIcon: false,
    //           //         textContainer: 18,
    //           //       ),
    //           //       SizedBox(width: 3.w),
    //           //       // const LikesCommentWidget(
    //           //       //   containerHeight: 20,
    //           //       //   containerWidth: 45,
    //           //       //   horizontalPadding: 2,
    //           //       //   imageSize: 17,
    //           //       //   isIcon: true,
    //           //       //   textContainer: 18,
    //           //       // ),
    //           //       // const Spacer(),
    //           //       // const HorizontalGap(width: 3),
    //           //     ],
    //           //   ),
    //           // ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}
