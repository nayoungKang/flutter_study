//bottomNavigationBar widget 이용해서 하단 바 생성
//safearea

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/auth/personal_input_screen.dart';
import 'package:twitter_clone/features/auth/widgets/auth_button.dart';
import 'package:twitter_clone/features/auth/widgets/form_button.dart';
import 'package:twitter_clone/features/common/common_appbar_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _navFunction(BuildContext context, StatefulWidget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return screen;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonAppBar(
        bottom: BottomAppBar(
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Have an account already?"),
              Gaps.h10,
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PersonalInputScreen()),
                  );
                },
                child: Text(
                  "Log in",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              )
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "See what's happening in the world right now.",
                  style: TextStyle(
                      fontSize: Sizes.size24 + Sizes.size2,
                      fontWeight: FontWeight.w800),
                ),
                Column(
                  children: [
                    AuthButton(
                      icon: const FaIcon(FontAwesomeIcons.google),
                      text: "Continue with Google",
                      navFunction: () =>
                          _navFunction(context, const PersonalInputScreen()),
                    ),
                    Gaps.v12,
                    AuthButton(
                      icon: const FaIcon(FontAwesomeIcons.apple),
                      text: "Continue with Apple",
                      navFunction: () =>
                          _navFunction(context, const PersonalInputScreen()),
                    ),
                    Gaps.v12,
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            width: double.maxFinite,
                            color: Colors.grey,
                          ),
                        ),
                        const Text("or"),
                        Expanded(
                          child: Container(
                            height: 1,
                            width: double.maxFinite,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Gaps.v12,
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PersonalInputScreen()),
                        );
                      },
                      child: const FormButton(
                        disabled: false,
                        btn_title: "Create account",
                      ),
                    ),
                    Gaps.v12,
                    const Text(
                      "By signing up, you agree to our Terms, Privacy Policy, and Cookie Use.",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
