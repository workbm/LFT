import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lft_new_project/common/utils/colors.dart';
import 'package:lft_new_project/common/widgets/bottom_navigation_bar_widget.dart';
import 'package:lft_new_project/common/widgets/gap.dart';
import 'package:lft_new_project/gen/assets.gen.dart';
import 'package:lft_new_project/widgets/home/home_page/menu_widget.dart';

import '../../widgets/drawer_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const routeName = '/profile-screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var tabs = [
    Tab(
      icon: Image.asset(
        Assets.img.profileIcon.path,
        height: 24,
        width: 24,
      ),
    ),
    Tab(
      icon: Image.asset(
        Assets.img.profileIcon.path,
        height: 24,
        width: 24,
      ),
    ),
    Tab(
      icon: Image.asset(
        Assets.img.profileIcon.path,
        height: 24,
        width: 24,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: const BottomNavigationBarWidget(),
      backgroundColor: CommonColors.backgroundColor,
      drawer: const DrawerWidget(),
      body: SafeArea(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            const MenuWidget(isMenu: true),
            const Gap(height: 20),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    CommonColors.darkOrange,
                    CommonColors.yellow2,
                  ],
                ),
              ),
              child: Container(
                margin: const EdgeInsets.all(1.5),
                decoration: const BoxDecoration(
                  color: CommonColors.white,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent, width: 5),
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                        'https://cdn.wallpapersafari.com/22/91/bU2uNi.jpg',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Gap(height: 20),
            Flexible(
              fit: FlexFit.tight,
              child: DefaultTabController(
                length: 3,
                child: SizedBox(
                  // height: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TabBar(
                        // padding: const EdgeInsets.all(0),
                        labelPadding: const EdgeInsets.symmetric(horizontal: 2),
                        indicator:
                            const BoxDecoration(color: Colors.transparent),
                        tabs: [
                          Tab(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Image.asset(
                                      Assets.img.profileIcon.path,
                                      height: 24,
                                      width: 24,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 3,
                                  width: double.infinity,
                                  color: CommonColors.darkGrey2,
                                )
                              ],
                            ),
                          ),
                          Tab(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Image.asset(
                                      Assets.img.heart.path,
                                      height: 21,
                                      width: 21,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 3,
                                  width: double.infinity,
                                  color: CommonColors.darkGrey2,
                                )
                              ],
                            ),
                          ),
                          Tab(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Image.asset(
                                      Assets.img.agenda.path,
                                      height: 24,
                                      width: 24,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 3,
                                  width: double.infinity,
                                  color: CommonColors.darkGrey2,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Expanded(
                        child: TabBarView(children: [
                          SingleChildScrollView(
                            child: Text('object 1'),
                          ),
                          Text('object 2'),
                          Text('object 3'),
                        ]),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
