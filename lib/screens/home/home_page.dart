import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lft_new_project/common/utils/colors.dart';
import 'package:lft_new_project/common/widgets/bottom_navigation_bar_widget.dart';
import 'package:lft_new_project/common/widgets/gap.dart';
import 'package:lft_new_project/widgets/home/home_page/menu_widget.dart';
import 'package:lft_new_project/widgets/home/home_page/restaurant/top_restaurant_widget.dart';

import '../../widgets/drawer_widget.dart';
import '../../widgets/home/home_page/activity/top_activity_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: const BottomNavigationBarWidget(),
      backgroundColor: CommonColors.backgroundColor,
      drawer: const DrawerWidget(),
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              MenuWidget(
                isMenu: true,
              ),
              Gap(height: 20),
              TopRestaurantWidget(),
              Gap(height: 20),
              TopActivityWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
