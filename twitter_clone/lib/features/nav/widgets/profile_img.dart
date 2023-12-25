import 'package:faker/faker.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/utils/util.dart';

enum ProfileImgType { Non, Plus, Heart, ReDirect }

class ProfileImg extends StatelessWidget {
  final ProfileImgType type;

  const ProfileImg({
    super.key,
    required this.faker,
    required this.type,
  });

  final Faker faker;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
            faker.image.image(random: true),
          ), //NetworkImage(faker.image.image()),
        ),
        if (type == ProfileImgType.Plus)
          Positioned(
            left: Sizes.size20,
            top: Sizes.size20,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: Sizes.size20 + Sizes.size4,
                  height: Sizes.size20 + Sizes.size4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const SizedBox(),
                ),
                Icon(
                  FontAwesomeIcons.circlePlus,
                  size: Sizes.size20,
                  color: isDarkMode(context) ? Colors.grey : Colors.black,
                ),
              ],
            ),
          ),
        if (type == ProfileImgType.Heart)
          Positioned(
            left: Sizes.size20,
            top: Sizes.size20,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: Sizes.size20 + Sizes.size4,
                  height: Sizes.size20 + Sizes.size4,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const SizedBox(),
                ),
                const Icon(
                  FontAwesomeIcons.heart,
                  color: Colors.white,
                  size: Sizes.size16,
                ),
              ],
            ),
          ),
        if (type == ProfileImgType.ReDirect)
          Positioned(
            left: Sizes.size20,
            top: Sizes.size20,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: Sizes.size20 + Sizes.size4,
                  height: Sizes.size20 + Sizes.size4,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const SizedBox(),
                ),
                const Icon(
                  FontAwesomeIcons.reply,
                  size: Sizes.size16,
                  color: Colors.white,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
