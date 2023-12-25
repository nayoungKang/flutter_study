import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/common/common_appbar_screen.dart';
import 'package:twitter_clone/features/onboarding/widgets/interest_button_.dart';
import 'package:twitter_clone/features/onboarding/sub_interest_button.dart';
import 'package:twitter_clone/features/onboarding/sub_interests.dart';

const upperInterests = [
  "Fashion & beauty",
  "Outdoors",
  "Arts & culture",
  "Animaion & comics",
  "Business & finance",
  "Food",
  "Travel",
  "Entertainment",
  "Music",
  "Gaming",
];

class UpperInterestsScreen extends StatefulWidget {
  const UpperInterestsScreen({super.key});

  @override
  State<UpperInterestsScreen> createState() => _UpperInterestsScreenState();
}

class _UpperInterestsScreenState extends State<UpperInterestsScreen> {
  int selectedCnt = 0;
  List<Interest_Button> buttons = [];

  @override
  void initState() {
    super.initState();
    //setstate?
    for (var interest in upperInterests) {
      buttons.add(Interest_Button(
        interest: interest,
        notifyDiscrement: _discrementCnt,
        notifyIncrement: _incrementCnt,
      ));
    }
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SubInterestsScreen(
                        genres: [Genre.Animation, Genre.Food, Genre.Travel],
                      ),
                    ),
                  );
                },
                child: const FittedBox(child: Text("Next")),
              ),
            ],
          ),
        ),
        child: Scrollbar(
          child: SingleChildScrollView(
            //controller: widget._scrollController,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.size32),
                  child: Column(
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
                Gaps.v16,
                Wrap(
                  spacing: Sizes.size14,
                  runSpacing: Sizes.size10,

                  ///alignment: WrapAlignment.spaceBetween,
                  children: [for (var btn in buttons) btn],
                )
              ],
            ),
          ),
        ));
  }
}
