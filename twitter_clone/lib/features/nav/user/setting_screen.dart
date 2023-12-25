import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/features/auth/login_screen.dart';
import 'package:twitter_clone/features/auth/repos/authentication_repo.dart';
import 'package:twitter_clone/features/nav/user/privacy_screen.dart';
import 'package:twitter_clone/settings/view_models/dark_theme_vm.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  //stf widget 일 때 레거시들
  // void _onPrivacyTapped(BuildContext context) {
  //   GoRouter.of(context).go('/setting/privacy');
  // }

  // void _onDarkModeSwitched(bool value) {
  //   context.read<DarkThemeConfigViewModel>().setDark(value);
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDark = ref.watch(DarkThemeProvider).isDark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          SwitchListTile.adaptive(
            title: const Row(
              children: [
                Icon(FontAwesomeIcons.gear),
                Gaps.h32,
                Text("Dark Mode"),
              ],
            ),
            value: isDark,
            onChanged: (value) =>
                ref.read(DarkThemeProvider.notifier).setDark(value),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(FontAwesomeIcons.userPlus),
            title: const Text("Follow and invite Friends"),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(FontAwesomeIcons.bell),
            title: const Text("Notifications"),
          ),
          ListTile(
            onTap: () {}, //=> _onPrivacyTapped(context),
            leading: const Icon(FontAwesomeIcons.lock),
            title: const Text("Privacy"),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(FontAwesomeIcons.circleUser),
            title: const Text("Account"),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(FontAwesomeIcons.lifeRing),
            title: const Text("Help"),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(FontAwesomeIcons.circleInfo),
            title: const Text("About"),
          ),
          const Divider(),
          TextButton(
            onPressed: () {
              ref.read(authRepo).signOut();
              //context.go(LoginScreen.routeURL);
              GoRouter.of(context).go(LoginScreen.routeURL);
              /*showAdaptiveDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog.adaptive(
                  title: const Text('Log out'),
                  content: const Text('Are you sure?'),
                  actions: [
                    IconButton(
                      onPressed: () {
                        //
                      },
                      icon: const Icon(FontAwesomeIcons.check),
                      color: Colors.red,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(FontAwesomeIcons.x),
                    ),
                  ],
                ),
              );*/
            },
            child: const Text(
              "Log out",
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
