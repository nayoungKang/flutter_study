import 'dart:math';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/nav/search/widgets/profile_tile.dart';
import 'package:twitter_clone/features/nav/widgets/profile_img.dart';
import 'package:twitter_clone/utils/util.dart';

class ActivityScreen extends StatelessWidget {
  ActivityScreen({super.key});
  static String routeName = "/activity";
  final List<String> tabNames = [
    "  All  ",
    "Replies",
    "Mentions",
    "Liked",
    " ... ",
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDark = isDarkMode(context);
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Activity",
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ButtonsTabBar(
                borderWidth: 1,
                borderColor: isDark ? Colors.white : Colors.black,
                unselectedBorderColor: Colors.grey,
                backgroundColor: isDark ? Colors.white : Colors.black,
                unselectedBackgroundColor: isDark ? Colors.black : Colors.white,
                unselectedLabelStyle: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                ),
                labelStyle: TextStyle(
                  color: isDark ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: Sizes.size20,
                ),
                tabs: [
                  ...tabNames.map(
                    (value) => Tab(
                      text: value,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var i = 0; i < 10; i++)
                            ProfileTile(
                              type: ProfileImgType.values[Random()
                                  .nextInt(ProfileImgType.values.length)],
                            ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var i = 0; i < 10; i++)
                            ProfileTile(
                              type: ProfileImgType.values[Random()
                                  .nextInt(ProfileImgType.values.length)],
                            ),
                        ],
                      ),
                    ),
                    const Center(),
                    const Center(),
                    const Center(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
