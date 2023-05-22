import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lft_new_project/common/utils/constants.dart';
import 'package:lft_new_project/provider/main_category_provider/main_category_provider.dart';
import 'package:lft_new_project/widgets/home/home_page/restaurant/restaurant_snippet.dart';
import 'package:provider/provider.dart';

import '../../../../common/utils/colors.dart';
import '../../../../common/widgets/gap.dart';
import '../../../../common/widgets/horizontal_gap.dart';
import '../../../../common/widgets/padding.dart';
import '../../../../screens/menu_categories/main_category_screen.dart';

class TopRestaurantWidget extends StatelessWidget {
  const TopRestaurantWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var data = context.read<MainCategoryProvider>();
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        PaddingWidget(
          horizontal: size.width * 0.04,
          vertical: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Top Restaurant',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const Gap(height: 7),
                  SizedBox(
                    width: size.width * 0.6,
                    child: const Text('Gastronomique Passionné à Paris'),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  data.goToSpecificCategory(
                      ConstantsClass.laFamilleGourmandeName);
                  Navigator.pushNamed(context, MainCategoryScreen.routeName);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AutoSizeText(
                      'Voir plus',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: CommonColors.red),
                      maxLines: 1,
                    ),
                    const HorizontalGap(width: 4),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: size.width * 0.07,
                      color: CommonColors.red,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Gap(height: 15),
        const RestaurantSnippet(),
      ],
    );
  }
}
