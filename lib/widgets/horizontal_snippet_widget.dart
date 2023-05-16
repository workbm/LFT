import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lft_new_project/provider/main_category_provider/main_category_provider.dart';
import 'package:provider/provider.dart';

import '../common/utils/colors.dart';
import '../common/utils/sizes.dart';
import '../common/widgets/gap.dart';
import '../common/widgets/horizontal_gap.dart';
import '../common/widgets/likes_widget.dart';

class HorizontalSnippetWidget extends StatelessWidget {
  const HorizontalSnippetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var listenData = context.watch<MainCategoryProvider>();
    return ListView.builder(
        itemCount: listenData.restaurants.length,
        itemBuilder: (context, index) {
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
            child: Row(
              children: [
                SizedBox(
                  height: 100.h,
                  width: 100.w,
                  child: PageView.builder(
                    itemCount: listenData.restaurants[index].images.length,
                    itemBuilder: (context, i) => Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            'https://image.cnbcfm.com/api/v1/image/107237975-1683618281463-gettyimages-1246198060-20221229_bath_golf_course_views_007.jpeg?v=1683629943&w=630&h=354&ffmt=webp&vtcrop=y',
                            // listenData.activities[index].images[i].url,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const HorizontalGap(width: 7),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.yellow,
                      width: 203.w,
                      height: 30.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            color: Colors.blueAccent,
                            width: 170.w,
                            height: 30.h,
                            child: AutoSizeText(
                              listenData.restaurants[index].name,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                          Icon(Icons.favorite_border, size: 20.w),
                        ],
                      ),
                    ),
                    const Gap(height: 5),
                    Container(
                      color: Colors.teal,
                      width: 203.w,
                      height: 30.h,
                      child: AutoSizeText(
                        listenData.restaurants[index].description,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    const Gap(height: 5),
                    Container(
                      width: 203.w,
                      color: Colors.orange,
                      child: Row(
                        children: [
                          const LikesWidget(
                            containerHeight: 20,
                            containerWidth: 45,
                            horizontalPadding: 2,
                            imageSize: 17,
                            isIcon: false,
                            textContainer: 18,
                          ),
                          SizedBox(width: 3.w),
                          const LikesWidget(
                            containerHeight: 20,
                            containerWidth: 45,
                            horizontalPadding: 2,
                            imageSize: 17,
                            isIcon: true,
                            textContainer: 18,
                          ),
                          const Spacer(),
                          !listenData.restaurants[index].discount
                              ? const SizedBox()
                              : Container(
                                  height: 20.h,
                                  width: 50.w,
                                  decoration: const BoxDecoration(
                                    color: CommonColors.red,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 1.w, vertical: 2.h),
                                  child: const Center(
                                    child: AutoSizeText(
                                      'Promo 20%',
                                      minFontSize: 8,
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: CommonColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                          const HorizontalGap(width: 3),
                          Container(
                            height: 20.h,
                            width: 50.w,
                            decoration: const BoxDecoration(
                              color: CommonColors.lightTeal,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
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
          );
        });
  }
}
