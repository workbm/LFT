import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/utils/colors.dart';
import '../../common/widgets/gap.dart';
import '../../widgets/drawer_widget.dart';
import '../../widgets/home/home_page/menu_widget.dart';
import '../../widgets/menu_categories/head_menu_category_widget.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 54.h,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              child: BottomNavigationBar(
                selectedFontSize: 0, unselectedFontSize: 0,
                iconSize: 30.w,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      color: CommonColors.yellow,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite_border,
                      color: CommonColors.pink,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person_outlined,
                      color: CommonColors.darkGreen,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.bookmark_border,
                      color: CommonColors.black,
                    ),
                    label: '',
                  ),
                ],
                // currentIndex: _selectedIndex,
                selectedItemColor: Colors.amber[800],
                // onTap: _onItemTapped,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: CommonColors.backgroundColor,
      drawer: const DrawerWidget(),
      body: SafeArea(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: const [
            MenuWidget(),
            Gap(height: 15),
            HeadMenuCategoryWidget(choice: 1),
            Gap(height: 15),
            // listenData.laoding
            //     ? const Center(child: CircularProgressIndicator())
            //     : const Expanded(
            //         child: HorizontalSnippetWidget(),
            //       )
          ],
        ),
      ),
    );
  }
}
