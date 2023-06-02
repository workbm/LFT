import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lft_new_project/screens/profile/profile_screen.dart';

import '../../gen/assets.gen.dart';
import '../../screens/home/home_page.dart';
import '../utils/colors.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, HomePage.routeName);
                    },
                    child: const Icon(
                      Icons.home,
                      color: CommonColors.yellow,
                    ),
                  ),
                  label: '',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_border,
                    color: CommonColors.pink,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ProfileScreen.routeName);
                    },
                    child: Icon(
                      Icons.person_outlined,
                      color: CommonColors.darkGreen,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    Assets.img.agenda.path,
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
    );
  }
}
