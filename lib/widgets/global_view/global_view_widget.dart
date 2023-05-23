import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lft_new_project/provider/detail_screen_provider/detail_screen_provider.dart';
import 'package:lft_new_project/screens/menu_categories/main_category_screen.dart';
import 'package:lft_new_project/widgets/global_view/global_view_loading_element_widget.dart';
import 'package:provider/provider.dart';

import '../../../../../common/widgets/gap.dart';
import '../../../../../common/widgets/padding.dart';
import '../../common/utils/colors.dart';
import '../../common/widgets/horizontal_gap.dart';

class GlobalViewWidget extends StatelessWidget {
  const GlobalViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var listenData = context.watch<DetailScreenProvider>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PaddingWidget(
          horizontal: size.width * 0.04,
          vertical: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                listenData.serviceName,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.amber,
                    width: 210.w,
                    child: const AutoSizeText(
                      'Où le bonheur de chaque instant fond en bouche',
                      maxLines: 2,
                      maxFontSize: 12,
                      style: TextStyle(color: CommonColors.textGrey),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, MainCategoryScreen.routeName);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                        const Icon(
                          Icons.keyboard_arrow_right,
                          // size: size.width * 0.07,
                          color: CommonColors.red,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Gap(height: 15),
        const GlobalViewLoadingElementWidget(),
      ],
    );
  }
}
