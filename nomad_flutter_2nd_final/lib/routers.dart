import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nomad_flutter_2nd_final/views/login_screen.dart';
import 'package:nomad_flutter_2nd_final/views/main_nav_screen.dart';
import 'package:nomad_flutter_2nd_final/views/signup_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final routerProvider = Provider(
  (ref) => GoRouter(
      initialLocation: LoginScreen.url, //'/',
      navigatorKey: _rootNavigatorKey,
      routes: [
        GoRoute(
          path: "/:tab(|moods|post)",
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) {
            final tab = state.pathParameters["tab"]!;
            return MainNavScreen(tab: tab);
          },
        ),
        GoRoute(
          path: LoginScreen.url,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: SignUpScreen.url,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => const SignUpScreen(),
        ),
      ]),
);
