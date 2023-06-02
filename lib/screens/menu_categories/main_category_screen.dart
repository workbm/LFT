import 'package:flutter/material.dart';
import 'package:lft_new_project/provider/main_category_provider/main_category_provider.dart';
import 'package:lft_new_project/widgets/horizontal_snippet_widget.dart';
import 'package:lft_new_project/widgets/menu_categories/head_menu_category_widget.dart';
import 'package:provider/provider.dart';

import '../../common/utils/colors.dart';
import '../../common/widgets/bottom_navigation_bar_widget.dart';
import '../../common/widgets/gap.dart';
import '../../widgets/drawer/drawer_widget.dart';
import '../../widgets/home/home_page/menu_widget.dart';

class MainCategoryScreen extends StatelessWidget {
  const MainCategoryScreen({super.key});
  static const routeName = '/main-category-screen';
  @override
  Widget build(BuildContext context) {
    var listenData = context.watch<MainCategoryProvider>();
    return Scaffold(
      bottomNavigationBar: const BottomNavigationBarWidget(),
      backgroundColor: CommonColors.backgroundColor,
      drawer: const DrawerWidget(),
      body: SafeArea(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            const MenuWidget(isMenu: true),
            const Gap(height: 15),
            const HeadMenuCategoryWidget(choice: 1),
            const Gap(height: 15),
            listenData.laoding
                ? const Center(child: CircularProgressIndicator())
                : const Expanded(
                    child: HorizontalSnippetWidget(),
                  )
          ],
        ),
      ),
    );
  }
}
