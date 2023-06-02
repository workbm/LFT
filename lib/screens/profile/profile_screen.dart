import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lft_new_project/common/utils/colors.dart';
import 'package:lft_new_project/common/widgets/bottom_navigation_bar_widget.dart';
import 'package:lft_new_project/common/widgets/gap.dart';
import 'package:lft_new_project/common/widgets/padding.dart';
import 'package:lft_new_project/gen/assets.gen.dart';
import 'package:lft_new_project/widgets/home/home_page/menu_widget.dart';
import 'package:lft_new_project/widgets/profile/tab_bar/account_profile_widget.dart';
import 'package:lft_new_project/widgets/profile/tab_bar/agenda_profile_widget.dart';
import 'package:lft_new_project/widgets/profile/tab_bar/favorite/main_catygories_choices.dart';

import '../../common/utils/sizes.dart';
import '../../widgets/drawer/drawer_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const routeName = '/profile-screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  var _loading = false;
  late TabController _tabController;
  var _index = 0;

  @override
  void initState() {
    setState(() {
      _loading = true;
    });
    _tabController = TabController(length: 3, vsync: this);

    print('index');
    print(_tabController.index);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        print('second index');
        print(_tabController.index);
        _index = _tabController.index;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            // Image
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
            // Tab
            Flexible(
              fit: FlexFit.tight,
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PaddingWidget(
                      horizontal: CommonSizes.paddingWith,
                      vertical: 20,
                      child: TabBar(
                        controller: _tabController,
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
                                      color: _index == 0
                                          ? CommonColors.lightTeal
                                          : CommonColors.darkGrey2,
                                      height: 24,
                                      width: 24,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 3,
                                  width: double.infinity,
                                  color: _index == 0
                                      ? CommonColors.lightTeal
                                      : CommonColors.darkGrey2,
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
                                      Assets.img.favories.path,
                                      color: _index == 1
                                          ? CommonColors.redMediumLight
                                          : CommonColors.darkGrey2,
                                      height: 21,
                                      width: 21,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 3,
                                  width: double.infinity,
                                  color: _index == 1
                                      ? CommonColors.redMediumLight
                                      : CommonColors.darkGrey2,
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
                                      color: _index == 2
                                          ? CommonColors.bluePale
                                          : CommonColors.darkGrey2,
                                      height: 24,
                                      width: 24,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 3,
                                  width: double.infinity,
                                  color: _index == 2
                                      ? CommonColors.bluePale
                                      : CommonColors.darkGrey2,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // TabBarView
                    Expanded(
                      child: TabBarView(
                          controller: _tabController,
                          children: const [
                            AccountProfileWidget(),
                            MainCategoriesChoicesProfileWidget(),
                            AgendaProfileWidget()
                          ]),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
