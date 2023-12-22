import 'dart:math';

import 'package:faker/faker.dart';

import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/features/nav/search/widgets/follow_button.dart';
import 'package:twitter_clone/features/nav/widgets/profile_img.dart';
import 'package:twitter_clone/features/nav/widgets/thread.dart';

class ProfileTile extends StatelessWidget {
  ProfileTile({super.key, required this.type});
  final ProfileImgType type;

  Faker faker = Faker();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            isThreeLine: true,
            leading: ProfileImg(
              faker: faker,
              type: type,
            ), //const CircleAvatar(child: Text('A')),
            title: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  faker.person.name(),
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  faker.person.name().toUpperCase(),
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Gaps.v3,
              ],
            )),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${Random().nextInt(100) + 1}K followers',
                ),
              ],
            ),
            trailing: const FollowButton() //const Icon(Icons.favorite_rounded),
            ),
        const Padding(
          padding: EdgeInsets.only(left: 70),
          child: Divider(),
        )
        // const Positioned(
        //   top: 80,
        //   bottom: 0,
        //   right: 0,
        //   left: 0,
        //   child: Divider(),
        // )
      ],
    );
  }
}
