import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lft_new_project/common/utils/colors.dart';
import 'package:lft_new_project/common/utils/sizes.dart';
import 'package:lft_new_project/common/widgets/gap.dart';
import 'package:lft_new_project/common/widgets/horizontal_gap.dart';
import 'package:lft_new_project/models/comment_model.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key, required this.comment});
  final CommentModel comment;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: CommonSizes.paddingWith,
        right: CommonSizes.paddingWith,
        bottom: 5.h,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: const BoxDecoration(
          color: CommonColors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          CommonColors.darkOrange,
                          CommonColors.yellow2,
                        ])),
                child: Container(
                  margin: const EdgeInsets.all(1.5),
                  decoration: const BoxDecoration(
                    color: CommonColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    height: 35,
                    width: 35,
                    margin: const EdgeInsets.all(2.5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent, width: 5),
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                            'https://i.guim.co.uk/img/media/07115c7cdf9ba47be3fdb3273b2380488d8edb96/44_279_976_585/master/976.jpg?width=465&quality=85&dpr=1&s=none'
                            // 'https://cdn.wallpapersafari.com/22/91/bU2uNi.jpg',
                            ),
                      ),
                    ),
                  ),
                ),
              ),
              const HorizontalGap(width: 7),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Jamilla challa'),
                  const Gap(height: 5),
                  Row(
                    children: [
                      RatingBar.builder(
                        ignoreGestures: true,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        initialRating: comment.review.rating,
                        itemCount: 5,
                        itemSize: 16.7.w,
                        // itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: CommonColors.yellow,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      const HorizontalGap(width: 5),
                      Text(DateFormat('d / M / yy').format(comment.review.time))
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
