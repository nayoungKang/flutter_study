import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/nav/widgets/extra_on_ellipsis.dart';
import 'package:twitter_clone/features/nav/widgets/profile_img.dart';
import 'package:twitter_clone/features/nav/widgets/thread.dart';

class ThreadScrollable extends StatefulWidget {
  final double width, height;
  final bool isImgPost;
  const ThreadScrollable({
    super.key,
    required this.width,
    required this.height,
    required this.isImgPost,
  });

  @override
  State<ThreadScrollable> createState() => _ThreadScrollableState();
}

class _ThreadScrollableState extends State<ThreadScrollable> {
  final faker = Faker();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              ProfileImg(
                faker: faker,
                type: ProfileImgType.Non,
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    faker.person.name(),
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Text(
                        "2h",
                        style:
                            TextStyle(color: Theme.of(context).disabledColor),
                      ),
                      Gaps.h5,
                      const ExtranOnEllipsis(),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var i = 0; i < 3; i++)
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: Sizes.size5),
                              child: Container(
                                width: widget.width,
                                height: widget.height,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Sizes.size16),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      faker.image.image(random: true),
                                    ),
                                  ),
                                ),
                                //child: Image.network(faker.image.image()),
                              ),
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
