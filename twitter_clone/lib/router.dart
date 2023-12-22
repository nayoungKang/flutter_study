//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter_clone/features/auth/signup_screen.dart';
import 'package:twitter_clone/features/nav/activity/activity_screen.dart';
import 'package:twitter_clone/features/nav/home_screen.dart';
import 'package:twitter_clone/features/nav/nav_main_screen.dart';
import 'package:twitter_clone/features/nav/search/search_screen.dart';
import 'package:twitter_clone/features/nav/user/privacy_screen.dart';
import 'package:twitter_clone/features/nav/user/setting_screen.dart';
import 'package:twitter_clone/features/nav/user/user_profile_screen.dart';

// final router = GoRouter(
//   routes: [
//     GoRoute(
//       path: "/",
//       builder: (context, state) => const NavMainScreen(),
//     ),
//     GoRoute(
//       path: "/search",
//       builder: (context, state) => const SearchScreen(),
//     ),
//     GoRoute(
//       path: "/activity",
//       builder: (context, state) => ActivityScreen(),
//     ),
//     GoRoute(
//       path: "/user",
//       builder: (context, state) => const UserProfileScreen(),
//     ),
//   ],
// );

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      pageBuilder: (context, state, child) {
        print(state.location);
        return NoTransitionPage(
          child: NavMainScreen(
            //location: state.location,
            child: child,
          ),
        );
      },
      routes: [
        GoRoute(
          path: '/',
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            return const NoTransitionPage(child: NavHomeScreen());
          },
        ),
        GoRoute(
          path: '/search',
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: SearchScreen(),
            );
          },
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/activity',
          pageBuilder: (context, state) {
            return NoTransitionPage(
              child: ActivityScreen(),
            );
          },
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/user',
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: UserProfileScreen(),
            );
          },
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/setting',
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: SettingScreen(),
            );
          },
          routes: [
            GoRoute(
              name: 'privacy',
              path: 'privacy',
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: PrivacyScreen());
              },
            ),
          ],
        ),
      ],
    ),
    // GoRoute(
    //   parentNavigatorKey: _rootNavigatorKey,
    //   path: '/login',
    //   pageBuilder: (context, state) {
    //     return NoTransitionPage(
    //       key: UniqueKey(),
    //       child: Scaffold(
    //         appBar: AppBar(),
    //         body: const Center(
    //           child: Text("Login"),
    //         ),
    //       ),
    //     );
    //   },
    // ),
  ],
);
