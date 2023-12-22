import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/common/common_appbar_screen.dart';
import 'package:twitter_clone/features/onboarding/upper_interests.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";

  bool _obscureText = true;
  bool _passwordValid = false;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length > 8;
  }

  void _onChanged(String? value) {
    if (!_isPasswordValid()) {
      _passwordValid = false;
    } else {
      _passwordValid = true;
    }
    setState(() {});
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (!_isPasswordValid()) return;
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const BirthdayScreen(),
    //   ),
    // );
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CommonAppBar(
        bottom: CupertinoButton(
          onPressed: () {
            if (!_isPasswordValid()) return;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UpperInterestsScreen()));
          },
          color: _passwordValid ? Colors.black : Colors.grey.shade500,
          child: const Text("Next"),
        ),
        child: GestureDetector(
          onTap: _onScaffoldTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size36,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v40,
                const Text(
                  "You'll need a password",
                  style: TextStyle(
                      fontSize: Sizes.size24 + Sizes.size2,
                      fontWeight: FontWeight.w800),
                ),
                Gaps.v16,
                Text(
                  "Make sure it's 8 characters or more",
                  style: TextStyle(
                      fontSize: Sizes.size16,
                      color: Theme.of(context).disabledColor),
                  textAlign: TextAlign.left,
                ),
                Gaps.v16,
                TextField(
                  controller: _passwordController,
                  onChanged: _onChanged,
                  onEditingComplete: _onSubmit,
                  obscureText: _obscureText,
                  autocorrect: false,
                  decoration: InputDecoration(
                    suffix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: _toggleObscureText,
                          child: FaIcon(
                            _obscureText
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        Gaps.h5,
                        _isPasswordValid()
                            ? const FaIcon(
                                FontAwesomeIcons.circleCheck,
                                size: Sizes.size20,
                                color: Colors.green,
                              )
                            : const SizedBox(),
                      ],
                    ),
                    hintText: "Password",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
                Gaps.v10,
              ],
            ),
          ),
        ));
  }
}
