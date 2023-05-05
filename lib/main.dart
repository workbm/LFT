import 'package:flutter/material.dart';
import 'package:lft_new_project/provider/auth/seconnecter_sinscrire_provider.dart';
import 'package:lft_new_project/provider/auth/sign_up_provider.dart';
import 'package:lft_new_project/router.dart';
import 'package:lft_new_project/screens/auth/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LFT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const Login(),
      builder: (context, child) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: child,
      ),
    );
  }
}
