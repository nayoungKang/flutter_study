//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter_clone/features/auth/login_form_screen.dart';
import 'package:twitter_clone/features/auth/login_screen.dart';
import 'package:twitter_clone/features/auth/repos/authentication_repo.dart';
import 'package:twitter_clone/features/auth/signup_form_screen.dart';
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

final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: LoginScreen.routeURL,
    navigatorKey: _rootNavigatorKey,
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;
      if (!isLoggedIn) {
        print("not logined");
        if (state.subloc != SignUpFormScreen.routeURL &&
            state.subloc != LoginFormScreen.routeURL &&
            state.subloc != LoginScreen.routeURL) {
          return SignUpFormScreen.routeURL;
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: SignUpScreen.routeURL,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: SignUpScreen(),
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: LoginScreen.routeURL,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: LoginScreen(),
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: SignUpFormScreen.routeURL,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: SignUpFormScreen(),
          );
        },
      ),

      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: LoginFormScreen.routeURL,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: LoginFormScreen(),
          );
        },
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state, child) {
          //print(state.location);
          return NoTransitionPage(
            child: NavMainScreen(
              //location: state.location,
              child: child,
            ),
          );
        },
        routes: [
          GoRoute(
            path: NavHomeScreen.routeURL,
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
  ),
);
