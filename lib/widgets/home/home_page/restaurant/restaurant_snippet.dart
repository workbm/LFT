import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lft_new_project/common/utils/colors.dart';
import 'package:lft_new_project/common/utils/sizes.dart';
import 'package:lft_new_project/common/widgets/gap.dart';
import 'package:lft_new_project/provider/home/top_restaurant_provider.dart';
import 'package:lft_new_project/screens/detail_screen/detail_screen.dart';
import 'package:provider/provider.dart';

import '../../../../common/utils/constants.dart';
import '../../../../provider/detail_screen_provider/detail_screen_provider.dart';
import '../../../../provider/main_category_provider/main_category_provider.dart';

class RestaurantSnippet extends StatefulWidget {
  const RestaurantSnippet({super.key});

  @override
  State<RestaurantSnippet> createState() => _RestaurantSnippetState();
}

class _RestaurantSnippetState extends State<RestaurantSnippet> {
  var _isLoading = false;
  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    context.read<TopRestaurantProvider>().getRestaurants().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var listenData = context.watch<TopRestaurantProvider>();
    return Padding(
      padding: EdgeInsets.only(left: CommonSizes.paddingWith),
      child: SizedBox(
        // color: Colors.amber,
        height: 230.h,
        width: double.infinity,
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: ListView.builder(
                  itemCount: listenData.restaurants.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      // Added To use Voi Plus
                      context.read<MainCategoryProvider>().goToSpecificCategory(
                          ConstantsClass.laFamilleGourmandeName);
                      //
                      context.read<DetailScreenProvider>().serviceChoice(
                          context, ConstantsClass.laFamilleGourmandeName);
                      Navigator.pushNamed(
                        context,
                        DetailScreen.routeName,
                        arguments: listenData.restaurants[index],
                      );
                    },
                    child: Center(
                      child: Container(
                        height: 230,
                        decoration: BoxDecoration(
                            color: CommonColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: CommonColors.backgroundColor
                                    .withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                              ),
                            ],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        margin: EdgeInsets.only(right: 7.w),
                        padding: EdgeInsets.symmetric(
                            vertical: 7.h, horizontal: 7.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 140.w,
                              height: 125.h,
                              child: PageView.builder(
                                itemCount:
                                    listenData.restaurants[index].images.length,
                                itemBuilder: (context, i) => Container(
                                  width: 140.w,
                                  height: 125.h,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                        listenData
                                            .restaurants[index].images[i].url,
                                        // 'https://image.cnbcfm.com/api/v1/image/107236863-1683379954526-27uIf9mw.jpg?v=1683559680&w=630&h=354&ffmt=webp&vtcrop=y',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Gap(height: 10),
                            SizedBox(
                              width: 140.w,
                              // height: 40.h,
                              child: const AutoSizeText(
                                'Restaurant',
                                // style: Theme.of(context).textTheme.headlineMedium,
                              ),
                            ),
                            SizedBox(
                              width: 140.w,
                              height: 30.h,
                              child: AutoSizeText(
                                listenData.restaurants[index].name,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 140.w,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 25.h,
                                    width: 60.w,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    decoration: const BoxDecoration(
                                        color: CommonColors.backgroundColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        )),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          GestureDetector(
                                            child: const Icon(
                                              Icons.favorite_border,
                                              color: CommonColors.red,
                                              size: 20,
                                            ),
                                          ),
                                          const Spacer(),
                                          const SizedBox(
                                            width: 25,
                                            child: AutoSizeText(
                                              '5.2k',
                                              maxLines: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5.w, child: const Text('')),
                                  Container(
                                    width: 60.w,
                                    height: 25.h,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    decoration: const BoxDecoration(
                                        color: CommonColors.backgroundColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        )),
                                    child: Center(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          GestureDetector(
                                            child: Image.asset(
                                              'assets/img/comment.png',
                                              height: 20.h,
                                              width: 20.w,
                                            ),
                                          ),
                                          const Spacer(),
                                          const SizedBox(
                                            width: 25,
                                            child: AutoSizeText(
                                              '5.2k',
                                              maxLines: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
