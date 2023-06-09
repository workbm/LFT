import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lft_new_project/provider/auth/login_provider.dart';
import 'package:lft_new_project/provider/auth/seconnecter_sinscrire_provider.dart';
import 'package:lft_new_project/provider/auth/sign_up_provider.dart';
import 'package:lft_new_project/provider/detail_screen_provider/detail_screen_provider.dart';
import 'package:lft_new_project/provider/home/categories_provider.dart';
import 'package:lft_new_project/provider/home/top_activity_provider.dart';
import 'package:lft_new_project/provider/home/top_restaurant_provider.dart';
import 'package:lft_new_project/provider/profile/agenda_event_provider.dart';
import 'package:lft_new_project/provider/profile/favorites/add_service_to_favory_provider.dart';
import 'package:lft_new_project/provider/profile/favorites/favorites_service_profile_provider.dart';
import 'package:lft_new_project/router.dart';
import 'package:lft_new_project/screens/home/home_page.dart';
import 'package:provider/provider.dart';

import 'provider/main_category_provider/main_category_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AddServiceElementToFavoryProvider()),
        ChangeNotifierProvider(create: (_) => AgendaEventProvider()),
        ChangeNotifierProvider(create: (_) => CategoriesProvider()),
        ChangeNotifierProvider(create: (_) => DetailScreenProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteServiceProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => MainCategoryProvider()),
        ChangeNotifierProvider(create: (_) => SeconnecterSinscrireProvider()),
        ChangeNotifierProvider(create: (_) => SignupProvider()),
        ChangeNotifierProvider(create: (_) => TopActivityProvider()),
        ChangeNotifierProvider(create: (_) => TopRestaurantProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      textTheme: TextTheme(
        headlineLarge: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
        headlineMedium: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
        titleSmall: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
      ),
    );
    print('how many time the main run');
    return ScreenUtilInit(
      designSize: const Size(360, 752),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LFT',
        theme: theme,
        onGenerateRoute: (settings) => generateRoute(settings),
        home: child,
        builder: (context, child) => GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
          child: child,
        ),
      ),
      child: const HomePage(),
    );
  }
}
