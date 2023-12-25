import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/nav/widgets/extra_on_ellipsis.dart';
import 'package:twitter_clone/features/nav/widgets/profile_img.dart';

class Thread extends StatefulWidget {
  final double width, height;
  final bool isImgPost;
  final ProfileImgType type;
  const Thread({
    super.key,
    required this.width,
    required this.height,
    required this.isImgPost,
    required this.type,
  });

  @override
  State<Thread> createState() => _ThreadState();
}

class _ThreadState extends State<Thread> {
  final faker = Faker();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size16,
            vertical: Sizes.size14,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileImg(
                    faker: faker,
                    type: widget.type,
                  ),
                  // Container(
                  //   child: Text(
                  //     "|",
                  //     style: TextStyle(
                  //       color: Theme.of(context).disabledColor,
                  //       fontSize: Sizes.size28,
                  //       fontWeight: FontWeight.w200,
                  //     ),
                  //   ),
                  // ),
                  // CircleAvatar(
                  //     backgroundImage: NetworkImage(faker.image
                  //         .image()) //NetworkImage(faker.image.image()),
                  //     ),
                ],
              ),
              Expanded(
                //text overflow를 해결하지 못했었는데 text를 감싸는 부모 위젯이 width가 측정되지 않아 그런것. expanded로 해결
                child: Padding(
                  padding: const EdgeInsets.only(left: Sizes.size10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            faker.person.name(),
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Row(
                            children: [
                              Text(
                                "2h",
                                style: TextStyle(
                                  color: Theme.of(context).disabledColor,
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
                      widget.isImgPost
                          ? SingleChildScrollView(
                              clipBehavior: Clip.none,
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (var i = 0; i < 3; i++)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: Sizes.size5,
                                      ),
                                      child: Container(
                                        width: widget.width,
                                        height: widget.height,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            Sizes.size16,
                                          ),
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
                          : Expanded(
                              child: Text(
                                faker.lorem.sentence(),
                                softWrap: true,
                              ),
                            ),
                      Gaps.v16,
                      const Row(
                        children: [
                          FaIcon(FontAwesomeIcons.heart),
                          Gaps.h14,
                          FaIcon(FontAwesomeIcons.message),
                          Gaps.h14,
                          FaIcon(FontAwesomeIcons.refresh),
                          Gaps.h14,
                          FaIcon(FontAwesomeIcons.paperPlane),
                        ],
                      ),
                      const Row(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Post_Bottom_Extra_Button extends StatefulWidget {
  final String firstBtn, SeconBtn;
  final Function onSeconBtnTap;
  const Post_Bottom_Extra_Button({
    super.key,
    required this.firstBtn,
    required this.SeconBtn,
    required this.onSeconBtnTap,
  });

  @override
  State<Post_Bottom_Extra_Button> createState() =>
      _Post_Bottom_Extra_ButtonState();
}

class _Post_Bottom_Extra_ButtonState extends State<Post_Bottom_Extra_Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: Sizes.size16, top: Sizes.size10),
            child: Text(
              widget.firstBtn,
              style: const TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: widget.onSeconBtnTap(),
            child: Padding(
              padding: const EdgeInsets.only(
                left: Sizes.size16,
                bottom: Sizes.size10,
              ),
              child: Text(
                widget.SeconBtn,
                style: const TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
