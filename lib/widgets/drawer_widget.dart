import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/utils/colors.dart';
import '../common/utils/sizes.dart';
import '../common/widgets/gap.dart';
import '../common/widgets/horizontal_gap.dart';
import 'home/menu/menu_card_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Drawer(
            child: Container(
          color: CommonColors.backgroundColor,
          padding: EdgeInsets.symmetric(
              horizontal: CommonSizes.paddingWith,
              vertical: (CommonSizes.paddingWith) * 2),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: ListTile(
                    leading: Container(
                      height: 48.w,
                      width: 48.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            'https://cdn.wallpapersafari.com/22/91/bU2uNi.jpg',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'Sadea Jessica',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    subtitle: Text(
                      'sadekjessica@gmail.com',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    trailing: Icon(
                      Icons.notifications_none,
                      color: CommonColors.black,
                      size: 30.w,
                    ),
                  ),
                ),
                const Gap(height: 15),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: ListTile(
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.account_circle_outlined,
                          color: CommonColors.black,
                        ),
                        HorizontalGap(width: 5),
                        Text(
                          'Modifier mon profil',
                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.edit,
                      color: CommonColors.black,
                      size: 17.w,
                    ),
                  ),
                ),
                const Gap(height: 15),
                const MenuCardWidget(choice: 1),
                const MenuCardWidget(choice: 2),
                const MenuCardWidget(choice: 3),
                const MenuCardWidget(choice: 4),
                const MenuCardWidget(choice: 5),
                const MenuCardWidget(choice: 6),
                const MenuCardWidget(choice: 7),
                const Gap(height: 11),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: ListTile(
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.logout,
                          color: CommonColors.red,
                        ),
                        HorizontalGap(width: 20),
                        Text(
                          'Déconnexion',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
