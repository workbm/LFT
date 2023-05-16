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
  var _filterTapped = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Future.delayed(Duration.zero).then((value) {
        context.read<MainCategoryProvider>().loadingFct(true);
        context.read<MainCategoryProvider>().getInfoFct().then((_) {
          context.read<MainCategoryProvider>().loadingFct(false);
        });
      });
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
  static const _filter = [
    'Titre',
    'Date croissant',
    'Date décroissant',
    'Plus aimé',
    'Plus commenté'
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
                      ? ConstantsClass.laFamilleGourmandeImage
                      : ConstantsClass.laFamilleSamuseImage,
                  height: 20.h,
                  width: 20.w),
              const HorizontalGap(width: 5),
              Container(
                color: Colors.teal,
                width: 230.w,
                child: AutoSizeText(
                    widget.choice == 1
                        ? ConstantsClass.laFamilleGourmandeName
                        : ConstantsClass.laFamilleSamuseName,
                    style: Theme.of(context).textTheme.headlineLarge),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _filterTapped = !_filterTapped;
                  });
                },
                child: Row(
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
                    const HorizontalGap(width: 2),
                    Icon(
                      Icons.expand_more,
                      size: 15.w,
                      color: CommonColors.red,
                    )
                  ],
                ),
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
                  ],
                ),
              ),
            ],
          ),
          const Gap(height: 10),
          if (_tapped)
            Wrap(
              spacing: 5.w,
              runSpacing: 5.h,
              children: _restaurants
                  .map(
                    (e) => GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Text(
                          e,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: CommonColors.textGrey),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          (_filterTapped && _tapped)
              ? Column(
                  children: const [Gap(height: 5), Divider(), Gap(height: 5)],
                )
              : const SizedBox(),
          !_filterTapped
              ? const SizedBox()
              : Wrap(
                  spacing: 5.w,
                  runSpacing: 5.h,
                  children: _filter
                      .map((filter) => GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Text(
                                filter,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: CommonColors.textGrey),
                              ),
                            ),
                          ))
                      .toList(),
                )
        ],
      ),
    );
  }
}
