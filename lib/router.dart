import 'package:flutter/material.dart';
import 'package:lft_new_project/models/service_model.dart';
import 'package:lft_new_project/screens/auth/login.dart';
import 'package:lft_new_project/screens/detail_screen/detail_screen.dart';
import 'package:lft_new_project/screens/home/home_page.dart';
import 'package:lft_new_project/screens/intro/screen_1.dart';
import 'package:lft_new_project/screens/intro/screen_2.dart';
import 'package:lft_new_project/screens/intro/screen_3.dart';
import 'package:lft_new_project/screens/intro/screen_4.dart';
import 'package:lft_new_project/screens/menu_categories/main_category_screen.dart';
import 'package:lft_new_project/screens/profile/profile_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DetailScreen.routeName:
      final service = settings.arguments as ServiceModel;
      return MaterialPageRoute(
        builder: (context) => DetailScreen(service: service),
      );
    case HomePage.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomePage(),
      );
    case MainCategoryScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const MainCategoryScreen(),
      );
    case ProfileScreen.routeName:
      return MaterialPageRoute(builder: (context) => const ProfileScreen());
    case Screen1.routeName:
      return MaterialPageRoute(
        builder: (context) => const Screen1(),
      );
    case Screen2.routeName:
      return MaterialPageRoute(
        builder: (context) => const Screen2(),
      );
    case Screen3.routeName:
      return MaterialPageRoute(
        builder: (context) => const Screen3(),
      );
    case Screen4.routeName:
      return MaterialPageRoute(
        builder: (context) => const Screen4(),
      );
    case Login.routeName:
      return MaterialPageRoute(
        builder: (context) => const Login(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const Screen1(),
      );
  }
}
