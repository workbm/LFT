import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lft_new_project/common/utils/sizes.dart';
import 'package:lft_new_project/common/widgets/add_comment_widget.dart';
import 'package:lft_new_project/common/widgets/horizontal_gap.dart';
import 'package:lft_new_project/common/widgets/likes_widget.dart';
import 'package:lft_new_project/gen/assets.gen.dart';
import 'package:lft_new_project/models/service_model.dart';
import 'package:lft_new_project/widgets/detail_widget/review_widget.dart';
import 'package:lft_new_project/widgets/global_view/global_view_widget.dart';
import 'package:lft_new_project/widgets/home/home_page/favorite_icon_widgte.dart';

import '../../common/utils/colors.dart';
import '../../common/widgets/bottom_navigation_bar_widget.dart';
import '../../common/widgets/gap.dart';
import '../../widgets/home/home_page/menu_widget.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.service});
  static const routeName = '/detail-screen';
  final ServiceModel service;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var _noteAvisTapped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: !_noteAvisTapped
          ? const BottomNavigationBarWidget()
          : const AddCommentWidget(),
      backgroundColor: CommonColors.backgroundColor,
      // drawer: const DrawerWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              const MenuWidget(
                isMenu: false,
              ),
              const Gap(height: 15),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    horizontal: CommonSizes.paddingWith,
                    vertical: CommonSizes.paddingWith),
                decoration: const BoxDecoration(
                    color: CommonColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          color: Colors.blueAccent,
                          width: 250.w,
                          child: AutoSizeText(
                            widget.service.name,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ),
                        const Spacer(),
                        Image.asset(Assets.img.agenda2.path),
                        const HorizontalGap(width: 5),
                        FavoriteIconHomeWidget(
                            serviceModel: widget.service.mainCategoryName,
                            elementID: widget.service.id,
                            isFavorite: widget.service.liked)
                      ],
                    ),
                    const Gap(height: 10),
                    Row(
                      children: [
                        Image.asset(
                          Assets.img.location.path,
                        ),
                        const HorizontalGap(width: 5),
                        const Text('Saulx-les-Chartreux, Paris')
                      ],
                    ),
                    const Gap(height: 15),
                    Row(
                      children: [
                        Container(
                          height: 235.h,
                          width: 220.w,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  widget.service.images[0].url),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 235.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: widget.service.images
                                .take(3)
                                .map(
                                  (e) => Container(
                                    height: 75.h,
                                    width: 105.w,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
                                      image: DecorationImage(
                                        image:
                                            CachedNetworkImageProvider(e.url),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        )
                      ],
                    ),
                    const Gap(height: 15),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(Assets.img.time.path),
                                const HorizontalGap(width: 5),
                                Text(
                                  'Open today',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        fontSize: 14,
                                        color: CommonColors.textGrey,
                                      ),
                                )
                              ],
                            ),
                            const Gap(height: 10),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  // color: Colors.amber,
                                  width: 150.w,
                                  child: Text(
                                    '10:00 AM - 12:00 PM',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(fontSize: 14),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        const LikesCommentWidget(
                            containerWidth: 75,
                            containerHeight: 30,
                            horizontalPadding: 5,
                            imageSize: 18,
                            isIcon: true,
                            textContainer: 35),
                        const HorizontalGap(width: 5),
                        const LikesCommentWidget(
                            containerWidth: 75,
                            containerHeight: 30,
                            horizontalPadding: 5,
                            imageSize: 18,
                            isIcon: false,
                            textContainer: 35)
                      ],
                    ),
                    const Gap(height: 15),
                    SizedBox(
                      // color: Colors.amber,
                      width: double.infinity,
                      height: 25.h,
                      child: Center(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.service.tagList.length,
                          itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.only(right: 7.w),
                            padding: EdgeInsets.symmetric(
                                horizontal: 7.w, vertical: 2.h),
                            decoration: BoxDecoration(
                              border: Border.all(color: CommonColors.grey),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Center(
                              child: Text(widget.service.tagList[index].name,
                                  style: const TextStyle(
                                      color: CommonColors.grey)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Gap(height: 15),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              color: Colors.cyan,
                              // width: ,
                              child: Text(
                                'Note et avis',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _noteAvisTapped = !_noteAvisTapped;
                                });
                              },
                              child: const Icon(
                                Icons.expand_more,
                                color: CommonColors.pink,
                              ),
                            ),
                          ],
                        ),
                        const Gap(height: 7),
                        !_noteAvisTapped
                            ? const SizedBox()
                            : Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                          color: Colors.deepOrange,
                                          height: 40.h,
                                          width: 80.h,
                                          child: const FittedBox(
                                            fit: BoxFit.fill,
                                            child: Center(
                                              child: Text(
                                                '4.0',
                                                // maxFontSize: 25,
                                              ),
                                            ),
                                          )),
                                      const Gap(height: 7),
                                      RatingBar.builder(
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 16.7.w,
                                        // itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: CommonColors.yellow,
                                        ),
                                        onRatingUpdate: (rating) {},
                                      ),
                                    ],
                                  ),
                                  const HorizontalGap(width: 20),
                                  Container(
                                    width: 200.w,
                                    color: Colors.indigoAccent,
                                    child: const AutoSizeText(
                                      'les notes et les avis sont validés. Ils sont fournis par des personnes réel',
                                      // softWrap: true,
                                    ),
                                  )
                                ],
                              ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(height: 15),
              if (_noteAvisTapped)
                ...widget.service.commentList.map(
                  (e) => ReviewWidget(comment: e),
                ),
              if (!_noteAvisTapped) const GlobalViewWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
