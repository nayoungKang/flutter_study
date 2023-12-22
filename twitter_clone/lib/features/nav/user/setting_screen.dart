import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/features/nav/user/privacy_screen.dart';
import 'package:twitter_clone/settings/view_models/dark_theme_vm.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  void _onPrivacyTapped(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const PrivacyScreen()),
    // );
    GoRouter.of(context).go('/setting/privacy');
  }

  void _onDarkModeSwitched(bool value) {
    context.read<DarkThemeConfigViewModel>().setDark(value);
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkThemeConfigViewModel>().isDark;

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
            onChanged: _onDarkModeSwitched,
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
            onTap: () => _onPrivacyTapped(context),
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
            onPressed: () => showAdaptiveDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog.adaptive(
                title: const Text('Log out'),
                content: const Text('Are you sure?'),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
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
            ),
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
