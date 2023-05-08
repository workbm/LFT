import 'package:flutter/material.dart';
import 'package:lft_new_project/widgets/home/home_page/restaurant/restaurant_snippet.dart';

class TopRestaurantWidget extends StatelessWidget {
  const TopRestaurantWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: const [
        // PaddingWidget(
        //   horizontal: size.width * 0.04,
        //   vertical: 0,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(
        //             'Top Restaurant',
        //             style: Theme.of(context).textTheme.headlineLarge,
        //           ),
        //           const Gap(height: 7),
        //           SizedBox(
        //             width: size.width * 0.6,
        //             child: const Text('Gastronomique Passionné à Paris'),
        //           ),
        //         ],
        //       ),
        //       Row(
        //         children: [
        //           AutoSizeText(
        //             'Voir plus',
        //             style: Theme.of(context)
        //                 .textTheme
        //                 .headlineMedium!
        //                 .copyWith(color: CommonColors.red),
        //             maxLines: 1,
        //           ),
        //           const HorizontalGap(width: 4),
        //           Icon(
        //             Icons.keyboard_arrow_right,
        //             size: size.width * 0.07,
        //             color: CommonColors.red,
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        // const Gap(height: 15),
        RestaurantSnippet(),
      ],
    );
  }
}
