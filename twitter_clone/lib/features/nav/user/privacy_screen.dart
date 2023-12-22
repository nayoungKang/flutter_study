import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    bool isprivated = false;

    void onPrivateSwitchChanged(bool? value) {
      if (value == null) return;
      setState(() {
        isprivated = value;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy"),
        // leading: const Row(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     FaIcon(FontAwesomeIcons.angleLeft),
        //     Text("Back"),
        //   ],
        // ),
      ),
      body: Column(
        children: [
          SwitchListTile.adaptive(
            value: isprivated,
            onChanged: onPrivateSwitchChanged,
            title: const Row(
              children: [
                Icon(FontAwesomeIcons.lock),
                Gaps.h5,
                Text("Follow and invite Friends"),
              ],
            ),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.thumbsUp),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Mentions"),
                Text(
                  "everyone",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            trailing: FaIcon(FontAwesomeIcons.angleRight),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.bellSlash),
            title: Text("Muted"),
            trailing: FaIcon(FontAwesomeIcons.angleRight),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.eyeSlash),
            title: Text("Hidden Words"),
            trailing: FaIcon(FontAwesomeIcons.angleRight),
          ),
          const Divider(),
          const ListTile(
            isThreeLine: true,
            title: Text("Other settings"),
            subtitle: Text(
              "Some settings, like restrict, apply to both Threads Instagram and can be managed on Instagram.",
            ),
            trailing: FaIcon(FontAwesomeIcons.shareFromSquare),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.eyeSlash),
            title: Text("Blocked Profiles"),
            trailing: FaIcon(FontAwesomeIcons.shareFromSquare),
          ),
        ],
      ),
    );
  }
}
