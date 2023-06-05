import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lft_new_project/common/utils/constants.dart';
import 'package:lft_new_project/common/utils/sizes.dart';
import 'package:lft_new_project/common/widgets/horizontal_gap.dart';
import 'package:lft_new_project/common/widgets/likes_widget.dart';
import 'package:lft_new_project/provider/detail_screen_provider/detail_screen_provider.dart';
import 'package:lft_new_project/provider/home/top_activity_provider.dart';
import 'package:lft_new_project/provider/main_category_provider/main_category_provider.dart';
import 'package:lft_new_project/widgets/home/home_page/favorite_icon_widgte.dart';
import 'package:lft_new_project/widgets/remise_global_widget.dart';
import 'package:provider/provider.dart';

import '../../../../common/utils/colors.dart';
import '../../../../common/widgets/gap.dart';
import '../../../../screens/detail_screen/detail_screen.dart';

class ActivitySnippet extends StatelessWidget {
  const ActivitySnippet({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    var listenData = context.watch<TopActivityProvider>();
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
          bottom: 5,
          right: CommonSizes.paddingWith,
          left: CommonSizes.paddingWith),
      child: GestureDetector(
        onTap: () {
          // Added To use Voir Plus
          context
              .read<MainCategoryProvider>()
              .goToSpecificCategory(ConstantsClass.laFamilleSamuseName);
          //
          context
              .read<DetailScreenProvider>()
              .serviceChoice(context, ConstantsClass.laFamilleSamuseName);
          Navigator.pushNamed(
            context,
            DetailScreen.routeName,
            arguments: listenData.activities[index],
          );
        },
        child: Row(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 100.h,
                  width: 100.w,
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: listenData.activities[index].images.length,
                    itemBuilder: (context, i) => Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            // 'https://image.cnbcfm.com/api/v1/image/107237975-1683618281463-gettyimages-1246198060-20221229_bath_golf_course_views_007.jpeg?v=1683629943&w=630&h=354&ffmt=webp&vtcrop=y',
                            listenData.activities[index].images[i].url,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                // Favorite Widget
                Positioned(
                  top: 4,
                  right: 4,
                  child: FavoriteIconHomeWidget(
                    serviceModel: ConstantsClass.laFamilleSamuseName,
                    elementID: listenData.activities[index].id,
                    isFavorite: listenData.activities[index].liked,
                  ),
                )
              ],
            ),
            const HorizontalGap(width: 7),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  // color: Colors.yellow,
                  width: 203.w,
                  height: 30.h,
                  child: AutoSizeText(
                    listenData.activities[index].name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const Gap(height: 5),
                SizedBox(
                  // color: Colors.teal,
                  width: 203.w,
                  height: 30.h,
                  child: AutoSizeText(
                    listenData.activities[index].description,
                    style: Theme.of(context).textTheme.bodySmall,
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
                      const Spacer(),
                      !listenData.activities[index].haveDiscount
                          ? const SizedBox()
                          : RemiseGlobalWidget(
                              remise: listenData.activities[index].remise
                                  .toString(),
                            ),
                      // Container(
                      //     height: 20.h,
                      //     width: 50.w,
                      //     decoration: const BoxDecoration(
                      //       color: CommonColors.red,
                      //       borderRadius:
                      //           BorderRadius.all(Radius.circular(3)),
                      //     ),
                      //     padding: EdgeInsets.symmetric(
                      //         horizontal: 1.w, vertical: 2.h),
                      //     child: Center(
                      //       child: AutoSizeText(
                      //         listenData.activities[index].remise
                      //             .toString(),
                      //         minFontSize: 8,
                      //         maxLines: 1,
                      //         style: const TextStyle(
                      //           color: CommonColors.white,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      const HorizontalGap(width: 3),
                      Container(
                        height: 20.h,
                        width: 50.w,
                        decoration: const BoxDecoration(
                          color: CommonColors.lightTeal,
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 1.w, vertical: 2.h),
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
      ),
    );
  }
}
