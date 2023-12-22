import 'dart:math';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/common/connect_buttons_set.dart';
import 'package:twitter_clone/features/nav/widgets/extra_on_ellipsis.dart';
import 'package:twitter_clone/features/nav/user/setting_screen.dart';
import 'package:twitter_clone/features/nav/user/widgets/replis_tab_detail.dart';
import 'package:twitter_clone/features/nav/user/widgets/user_sceen_tap_header.dart';
import 'package:twitter_clone/utils/util.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void _onSettingBtnPressed() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const SettingScreen(),
    //   ),
    // );

    GoRouter.of(context).go("/setting");
  }

  @override
  Widget build(BuildContext context) {
    var profileImgSrc = faker.image.image();
    var profileName = "Anne_Kang";
    final isDark = isDarkMode(context);
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.globe,
                          size: Sizes.size20,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(FontAwesomeIcons.instagram),
                          IconButton(
                            onPressed: _onSettingBtnPressed,
                            icon: const Icon(FontAwesomeIcons.gripLines),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: Sizes.size20),
                    title: const Text(
                      "Anne",
                      style: TextStyle(
                        fontSize: Sizes.size24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        Text(profileName),
                        Gaps.h10,
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size5,
                            vertical: Sizes.size2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(Sizes.size10),
                          ),
                          child: Text(
                            "thread.net",
                            style: TextStyle(
                              color: isDark ? Colors.black : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    trailing: CircleAvatar(
                      radius: 50,
                      foregroundImage: NetworkImage(profileImgSrc),
                    ),
                  ),
                  Gaps.v14,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: Sizes.size5,
                          horizontal: Sizes.size40,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(Sizes.size4),
                          ),
                          border: Border.all(color: Colors.grey.shade500),
                        ),
                        child: const Text(
                          ' Edit Profile ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: Sizes.size5,
                          horizontal: Sizes.size40,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(Sizes.size4),
                          ),
                          border: Border.all(color: Colors.grey.shade500),
                        ),
                        child: const Text(
                          'Share Profile',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverPersistentHeader(
              delegate: UserScreenTapHeader(),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Gaps.v10,
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: TabBarView(
                      children: [
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 20,
                          padding: const EdgeInsets.all(
                            Sizes.size10,
                          ),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      foregroundImage:
                                          NetworkImage(profileImgSrc),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: Sizes.size10,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  profileName,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "${Random().nextInt(10) + 1}h",
                                                      style: TextStyle(
                                                        color: Theme.of(
                                                          context,
                                                        ).disabledColor,
                                                      ),
                                                    ),
                                                    Gaps.h5,
                                                    const ExtranOnEllipsis(),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    faker.lorem.sentence(),
                                                    softWrap: true,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Gaps.v10,
                                            const ConnectButtonSet(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(),
                              ],
                            );
                          },
                        ),
                        ReplisTab(
                          profileImgSrc: profileImgSrc,
                          profileName: profileName,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
