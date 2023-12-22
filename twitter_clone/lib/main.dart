import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twitter_clone/router.dart';
import 'package:twitter_clone/settings/repos/dark_theme_repo.dart';
import 'package:twitter_clone/settings/view_models/dark_theme_vm.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();
  final repository = DarkThemeConfigRepository(preferences);

  runApp(
    ProviderScope(
      overrides: [
        DarkThemeProvider.overrideWith(
          () => DarkThemeConfigViewModel(repository),
        ),
      ],
      child: const TwitterApp(),
    ),
  );
}

class TwitterApp extends ConsumerWidget {
  const TwitterApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Twitter ZZap',

      theme: FlexThemeData.light(scheme: FlexScheme.sakura),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.sakura),
      //themeMode: ThemeMode.system,
      themeMode: ref.watch(DarkThemeProvider).isDark
          ? ThemeMode.dark
          : ThemeMode.light,
    );
  }
}
