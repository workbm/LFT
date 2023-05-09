import 'package:flutter/material.dart';
import 'package:lft_new_project/common/utils/colors.dart';
import 'package:lft_new_project/common/widgets/gap.dart';
import 'package:lft_new_project/widgets/home/home_page/activity/top_activity_widget.dart';
import 'package:lft_new_project/widgets/home/home_page/menu_widget.dart';
import 'package:lft_new_project/widgets/home/home_page/restaurant/top_restaurant_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const routeName = '/home-page';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CommonColors.backgroundColor,
      drawer: const Drawer(),
      body: SafeArea(
        child: Column(
          children: const [
            MenuWidget(),
            Gap(height: 20),
            TopRestaurantWidget(),
            Gap(height: 20),
            TopActivityWidget(),
          ],
        ),
      ),
    );
  }
}
