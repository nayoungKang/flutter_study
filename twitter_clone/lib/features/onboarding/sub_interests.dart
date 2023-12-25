import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/common/common_appbar_screen.dart';
import 'package:twitter_clone/features/onboarding/widgets/interest_button_.dart';
import 'package:twitter_clone/features/onboarding/sub_interest_button.dart';

const subgenres = [
  "Korea",
  "Japan",
  "USA",
  "Italy",
  "French",
  "UK",
  "Canada",
];

class SubInterestsScreen extends StatefulWidget {
  final List<Genre> genres;
  const SubInterestsScreen({super.key, required this.genres});

  @override
  State<SubInterestsScreen> createState() => _SubInterestsScreenState();
}

class _SubInterestsScreenState extends State<SubInterestsScreen> {
  int selectedCnt = 0;
  List<SubInterestButton> buttons = [];

  @override
  void initState() {
    super.initState();
    //setstate?
  }

  void _incrementCnt() {
    setState(() {
      selectedCnt++;
    });
  }

  void _discrementCnt() {
    setState(() {
      selectedCnt--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonAppBar(
        bottom: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              (selectedCnt >= 3)
                  ? const Text("Good Job")
                  : Text("$selectedCnt / 3 selected"),
              CupertinoButton(
                color: (selectedCnt >= 3)
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
                onPressed: () {},
                child: const Text(
                  "Next",
                ),
              )
            ],
          ),
        ),
        child: Scrollbar(
          child: SingleChildScrollView(
            //controller: widget._scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.size32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "What do you want to see on Twitter?",
                        style: TextStyle(
                            fontSize: Sizes.size24 + Sizes.size2,
                            fontWeight: FontWeight.w800),
                      ),
                      Gaps.v16,
                      Text(
                        "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
                        style: TextStyle(
                            fontSize: Sizes.size16,
                            color: Theme.of(context).disabledColor),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                Gaps.v10,
                const Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        for (var upperInterest in widget.genres)
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Sizes.size16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Gaps.v16,
                                    Text(
                                      upperInterest.toString().split(".")[1],
                                      style: const TextStyle(
                                          fontSize: Sizes.size20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Gaps.v16,
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Wrap(
                                        alignment: WrapAlignment.start,
                                        spacing: Sizes.size10,
                                        children: [
                                          for (var sub in subgenres)
                                            SubInterestButton(
                                              interest:
                                                  "$sub ${upperInterest.toString().split(".")[1]}",
                                              notifyDiscrement: _discrementCnt,
                                              notifyIncrement: _incrementCnt,
                                            )
                                        ],
                                      ),
                                    ),
                                    Gaps.v28,
                                  ],
                                ),
                              ),
                              const Divider()
                            ],
                          )
                      ],
                    ),
                  ],
                ),
                Gaps.v32
              ],
            ),
          ),
        ));
  }
}
