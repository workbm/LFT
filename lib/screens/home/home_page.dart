import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lft_new_project/common/utils/colors.dart';
import 'package:lft_new_project/common/widgets/gap.dart';
import 'package:lft_new_project/provider/home/categories_provider.dart';
import 'package:lft_new_project/widgets/home/home_page/menu_widget.dart';
import 'package:lft_new_project/widgets/home/home_page/restaurant/top_restaurant_widget.dart';
import 'package:provider/provider.dart';

import '../../widgets/drawer_widget.dart';
import '../../widgets/home/home_page/activity/top_activity_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _isLoading = false;
  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    context.read<CategoriesProvider>().getInfos().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
        child: SizedBox(
          height: size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              MenuWidget(),
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
