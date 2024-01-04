import 'package:flutter/material.dart';
import 'package:nomad_flutter_2nd_final/constants/gaps.dart';
import 'package:nomad_flutter_2nd_final/constants/sizes.dart';
import 'package:nomad_flutter_2nd_final/widgets/btn.dart';

class MoodPostScreen extends StatelessWidget {
  static const String url = '/post';
  MoodPostScreen({super.key});

  final List<String> moods = [
    "🥰",
    "🥳",
    "🤯",
    "🤒",
    "😭",
    "😵‍💫",
    "😎",
    "😡",
    "😇",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("How do you feel?"),
              const SizedBox(
                height: 200,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.multiline,
                ),
              ),
              const Text("Choose your mood"),
              SizedBox(
                height: Sizes.size32,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: moods.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: Sizes.size32,
                      height: Sizes.size32,
                      padding:
                          const EdgeInsets.symmetric(horizontal: Sizes.size3),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(Sizes.size10),
                          boxShadow: const [
                            BoxShadow(
                              // color: Colors.grey.withOpacity(0.7),
                              spreadRadius: 0,
                              // blurRadius: 5.0,
                              offset:
                                  Offset(1, 1), // changes position of shadow
                            ),
                          ]),
                      child: Center(
                        child: Text(
                          moods[index],
                          style: const TextStyle(fontSize: Sizes.size24),
                        ),
                      ),
                    );
                  },
                  //  Divider 로 구분자 추가.
                  separatorBuilder: (BuildContext context, int index) =>
                      Gaps.h10,
                ),
              ),
              Gaps.v14,
              const Center(child: Btn(txt: "Post")),
            ],
          ),
        ),
      ),
    );
  }
}
