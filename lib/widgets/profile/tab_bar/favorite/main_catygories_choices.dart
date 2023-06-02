import 'package:flutter/material.dart';
import 'package:lft_new_project/common/utils/constants.dart';
import 'package:lft_new_project/common/widgets/gap.dart';
import 'package:provider/provider.dart';

import '../../../../common/utils/sizes.dart';
import '../../../../common/widgets/padding.dart';
import '../../../../provider/profile/favorites/favorites_service_profile_provider.dart';
import '../../../global_view/global_view_snippet.dart';

class MainCategoriesChoicesProfileWidget extends StatefulWidget {
  const MainCategoriesChoicesProfileWidget({super.key});

  @override
  State<MainCategoriesChoicesProfileWidget> createState() =>
      _MainCategoriesChoicesProfileWidgetState();
}

class _MainCategoriesChoicesProfileWidgetState
    extends State<MainCategoriesChoicesProfileWidget> {
  final _mainCategoryName = ConstantsClass.laFamilleGourmandeName;
  var _isInit = true;
  final _loading = false;
  final _mainCategoryList = [
    ConstantsClass.laFamilleGourmandeName,
    ConstantsClass.laFamilleSamuseName,
    ConstantsClass.laFamilleVisiteName,
    ConstantsClass.laFamilleShopName,
  ];

  @override
  void didChangeDependencies() {
    print('didChangeDependencies called');
    if (_isInit) {
      Future.delayed(Duration.zero).then((value) {
        context.read<FavoriteServiceProvider>().loadingFct(true);
        context.read<FavoriteServiceProvider>().favoriteFct().then((_) {
          context.read<FavoriteServiceProvider>().loadingFct(false);
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var listenData = context.watch<FavoriteServiceProvider>();

    print('build run');
    return Column(
      children: [
        PaddingWidget(
          horizontal: CommonSizes.paddingWith,
          vertical: 10,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: _mainCategoryList
                  .map((e) => GestureDetector(
                        onTap: () {
                          context
                              .read<FavoriteServiceProvider>()
                              .serviceChoiceFct(e);
                          setState(() {
                            // _mainCategoryName = e;
                            _isInit = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 7, horizontal: 7),
                          margin: const EdgeInsets.only(right: 10),
                          child: Text(e),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
        const Gap(height: 15),
        listenData.laoding
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Expanded(
                child: ListView.builder(
                  itemCount: listenData.list.length,
                  itemBuilder: (context, index) => GlobalViewSnippet(
                    serviceModel: listenData.list[index],
                  ),
                ),
              ),
      ],
    );
  }
}
