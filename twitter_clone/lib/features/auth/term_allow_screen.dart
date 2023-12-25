import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/auth/signup_screen.dart';
import 'package:twitter_clone/features/auth/widgets/form_button.dart';
import 'package:twitter_clone/features/common/common_appbar_screen.dart';

class TermAllowScreen extends StatefulWidget {
  const TermAllowScreen({super.key});

  @override
  State<TermAllowScreen> createState() => _TermAllowScreenState();
}

class _TermAllowScreenState extends State<TermAllowScreen> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return CommonAppBar(
        bottom: null,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Customize your experience",
                      style: TextStyle(
                          fontSize: Sizes.size24 + Sizes.size2,
                          fontWeight: FontWeight.w800),
                    ),
                    Gaps.v16,
                    const Text(
                      "Track where you see Twitter\nconctent across the web",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Gaps.v16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: Text(
                            "Twitter uses this data to personalize your experience. This web browing history will never be stored with your name, email, or phone number.",
                            style: TextStyle(
                                fontSize: Sizes.size16 + Sizes.size2,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        CupertinoSwitch(
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value;
                              });
                            })
                      ],
                    ),
                    Gaps.v16,
                    const Text(
                      "By signing up,,,,,,",
                      style: TextStyle(
                          fontSize: Sizes.size14, fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context, true);
                  },
                  child: FormButton(
                    disabled: !_isChecked,
                    btn_title: "Next",
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
