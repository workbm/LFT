import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lft_new_project/common/utils/colors.dart';
import 'package:lft_new_project/common/utils/constants.dart';
import 'package:lft_new_project/common/utils/sizes.dart';
import 'package:lft_new_project/common/widgets/gap.dart';
import 'package:lft_new_project/common/widgets/horizontal_gap.dart';
import 'package:lft_new_project/provider/main_category_provider/main_category_provider.dart';
import 'package:provider/provider.dart';

class HeadMenuCategoryWidget extends StatefulWidget {
  const HeadMenuCategoryWidget({super.key, required this.choice});
  final int choice;

  @override
  State<HeadMenuCategoryWidget> createState() => _HeadMenuCategoryWidgetState();
}

class _HeadMenuCategoryWidgetState extends State<HeadMenuCategoryWidget> {
  var _isInit = true;
  var _tapped = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      context.watch<MainCategoryProvider>().getInfoFct();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  static const _restaurants = [
    'Petit déjeuner',
    'Déjeuner / Dîner',
    'Salon de thé/café',
    'Brunch',
  ];
  static const _activities = [
    'Plages',
    'Parcs',
    'Activités culturelles',
    'Activités nautiques',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: CommonSizes.paddingWith),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                  widget.choice == 1
                      ? ConstantsClass.familleGourmandeImage
                      : ConstantsClass.laFamilleSamuseImage,
                  height: 20.h,
                  width: 20.w),
              const HorizontalGap(width: 5),
              Container(
                color: Colors.teal,
                width: 230.w,
                child: AutoSizeText(
                    widget.choice == 1
                        ? ConstantsClass.familleGourmandeName
                        : ConstantsClass.laFamilleSamuseName,
                    style: Theme.of(context).textTheme.headlineLarge),
              ),
              const Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 50.w,
                    color: Colors.amber,
                    child: const AutoSizeText(
                      'Trier par',
                      maxLines: 1,
                      style: TextStyle(
                        color: CommonColors.red,
                      ),
                    ),
                  ),
                  const HorizontalGap(width: 5),
                  Icon(
                    Icons.expand_more,
                    size: 15.w,
                    color: CommonColors.red,
                  )
                ],
              )
            ],
          ),
          const Gap(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HorizontalGap(width: 25.w),
              Container(
                color: Colors.red.shade100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _tapped = !_tapped;
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            color: Colors.amber,
                            child: Text(
                              'data',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: CommonColors.textGrey),
                            ),
                          ),
                          Column(
                            children: [
                              const Gap(height: 5),
                              Icon(
                                Icons.expand_more,
                                size: 10.w,
                                color: CommonColors.textGrey,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Gap(height: 3),
                    if (_tapped)
                      ..._restaurants.map(
                        (e) => GestureDetector(
                          onTap: () {},
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                e,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: CommonColors.textGrey),
                              ),
                              const Gap(height: 3),
                            ],
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
  }
}
