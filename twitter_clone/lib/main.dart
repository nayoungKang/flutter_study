//import 'dart:js';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/auth/confirm_code_screen.dart';
import 'package:twitter_clone/features/auth/signup_screen.dart';
import 'package:twitter_clone/features/nav/nav_main_screen.dart';
import 'package:twitter_clone/features/onboarding/interest_detail_screen.dart';
import 'package:twitter_clone/features/onboarding/upper_interests.dart';
import 'package:twitter_clone/router.dart';
import 'package:twitter_clone/settings/repos/dark_theme_repo.dart';
import 'package:twitter_clone/settings/view_models/dark_theme_vm.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //
  final preferences = await SharedPreferences.getInstance();
  final repository = DarkThemeConfigRepository(preferences);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DarkThemeConfigViewModel(repository),
        ),
      ],
      child: const TwitterApp(),
    ),
  );
}

class TwitterApp extends StatelessWidget {
  const TwitterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Twitter ZZap',
      // theme: ThemeData(
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: Colors.white,
      //     titleTextStyle: TextStyle(
      //       color: Colors.black,
      //       fontSize: Sizes.size16 + Sizes.size2,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      //   scaffoldBackgroundColor: Colors.white,
      //   primaryColor: Colors.blue.shade300,
      //   disabledColor: Colors.grey.shade600,
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      //   bottomAppBarTheme: const BottomAppBarTheme(
      //     color: Colors.white,
      //   ),
      //   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      //     backgroundColor: Colors.white,
      //   ),
      // ),
      theme: FlexThemeData.light(scheme: FlexScheme.sakura),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.sakura),
      //themeMode: ThemeMode.system,
      themeMode: context.watch<DarkThemeConfigViewModel>().isDark
          ? ThemeMode.dark
          : ThemeMode.light,
      //home: const SignUpScreen(),
      //home: UpperInterestsScreen(),
      //home: const InterestDetailScreen(), //assignment 12 ta solution
      //home: const ConfirmationCodeScreen(emailAddress: "emailAddress@d.d"),

      //home: const NavMainScreen(), //assignment 13
    );
  }
}
