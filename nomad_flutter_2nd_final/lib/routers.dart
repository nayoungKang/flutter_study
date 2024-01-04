import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nomad_flutter_2nd_final/views/login_screen.dart';
import 'package:nomad_flutter_2nd_final/views/main_nav_screen.dart';

final routerProvider = Provider(
  (ref) => GoRouter(initialLocation: '/', routes: [
    GoRoute(
      path: "/:tab(|moods|post)",
      //name: MainNavigationScreen.routeName,
      builder: (context, state) {
        final tab = state.pathParameters["tab"]!;
        return MainNavScreen(tab: tab);
      },
    ),
    GoRoute(
      path: LoginScreen.url,
      builder: (context, state) => const LoginScreen(),
    )
  ]),
);
