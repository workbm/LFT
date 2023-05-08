import 'package:flutter/material.dart';
import 'package:lft_new_project/provider/auth/login_provider.dart';
import 'package:lft_new_project/provider/auth/seconnecter_sinscrire_provider.dart';
import 'package:lft_new_project/provider/auth/sign_up_provider.dart';
import 'package:lft_new_project/provider/home/top_restaurant_provider.dart';
import 'package:lft_new_project/router.dart';
import 'package:lft_new_project/screens/home/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => TopRestaurantProvider()),
        ChangeNotifierProvider(create: (_) => SeconnecterSinscrireProvider()),
        ChangeNotifierProvider(create: (_) => SignupProvider()),
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
        headlineMedium:
            Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 15),
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LFT',
      theme: theme,
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const HomePage(),
      builder: (context, child) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: child,
      ),
    );
  }
}
