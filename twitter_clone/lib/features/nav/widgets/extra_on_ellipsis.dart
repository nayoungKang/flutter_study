import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/nav/widgets/thread.dart';

class ExtranOnEllipsis extends StatelessWidget {
  const ExtranOnEllipsis({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size32,
                horizontal: Sizes.size24,
              ),
              child: SizedBox(
                height: Sizes.size96 * 2,
                child: Column(
                  children: [
                    Post_Bottom_Extra_Button(
                      firstBtn: "Unfollow",
                      SeconBtn: "Mute",
                      onSeconBtnTap: () {},
                    ),
                    Gaps.v24,

                    ////////////
                    ///
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                  left: Sizes.size16, top: Sizes.size10),
                              child: Text(
                                "Hide",
                                style: TextStyle(
                                    fontSize: Sizes.size16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const Divider(),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      //
                                      return Scaffold(
                                        appBar: AppBar(
                                          title: const Text(
                                            "Report",
                                          ),
                                        ),
                                        body: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Divider(),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: Sizes.size16,
                                                    vertical: Sizes.size10),
                                                child: Text(
                                                  "Why are you reporting this Thread?",
                                                  style: TextStyle(
                                                    fontSize: Sizes.size16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    left: Sizes.size16,
                                                    right: Sizes.size16),
                                                child: Text(
                                                    "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is immediate danger, call the local emergency services - don't wait."),
                                              ),
                                              const Divider(),
                                              ...[
                                                "I just don't like it",
                                                "It's unlawful content under NetzDG",
                                                "It's spam",
                                                "Hate speech or symbols",
                                                "Nudity or sexual activity"
                                              ].map((text) => ListTile(
                                                    title: Text(text),
                                                    trailing: const Icon(
                                                      size: Sizes.size14,
                                                      Icons.arrow_forward_ios,
                                                    ),
                                                    shape: const Border(
                                                        bottom: BorderSide(
                                                            width: 1,
                                                            color:
                                                                Colors.grey)),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: Sizes.size16, bottom: Sizes.size10),
                                child: Text(
                                  "Report",
                                  style: TextStyle(
                                    fontSize: Sizes.size16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red.shade400,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
      child: const FaIcon(FontAwesomeIcons.ellipsis),
    );
  }
}
