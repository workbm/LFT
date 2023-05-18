import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lft_new_project/common/utils/colors.dart';
import 'package:lft_new_project/common/utils/sizes.dart';
import 'package:lft_new_project/common/widgets/horizontal_gap.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: CommonSizes.paddingWith),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: const BoxDecoration(
          color: CommonColors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        children: [
          Row(
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
                          'https://cdn.wallpapersafari.com/22/91/bU2uNi.jpg',
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const HorizontalGap(width: 7),
          Column(
            children: const [Text('Jamilla challa')],
          )
        ],
      ),
    );
  }
}
