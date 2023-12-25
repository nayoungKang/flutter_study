import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/common/connect_buttons_set.dart';
import 'package:twitter_clone/features/nav/widgets/extra_on_ellipsis.dart';
import 'package:twitter_clone/utils/util.dart';

class ReplisTab extends StatelessWidget {
  const ReplisTab({
    super.key,
    required this.profileImgSrc,
    required this.profileName,
  });

  final String profileImgSrc;
  final String profileName;

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return ListView.builder(
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
                IntrinsicHeight(
                  child: Column(
                    //mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        foregroundImage: NetworkImage(
                          faker.image.image(random: true),
                        ),
                      ),
                      Gaps.v10,
                      IntrinsicHeight(
                        child: Container(
                          constraints: const BoxConstraints(
                            minHeight: Sizes.size40,
                            maxHeight: Sizes.size44,
                          ),
                          color: isDark ? Colors.white : Colors.black45,
                          width: Sizes.size2,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: Sizes.size10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              faker.person.name(),
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
            Gaps.v10,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  foregroundImage: NetworkImage(profileImgSrc),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: Sizes.size10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
