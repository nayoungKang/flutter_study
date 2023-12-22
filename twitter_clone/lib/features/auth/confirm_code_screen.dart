import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/auth/password_screen.dart';
import 'package:twitter_clone/features/common/common_appbar_screen.dart';

class ConfirmationCodeScreen extends StatefulWidget {
  final String emailAddress;
  const ConfirmationCodeScreen({super.key, required this.emailAddress});

  @override
  State<ConfirmationCodeScreen> createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isFilled = false;

  void _onChanged(String? value) {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        isFilled = true;
      } else {
        isFilled = false;
      }
      setState(() {});

      if (value != null && value.isNotEmpty) {
        FocusScope.of(context).nextFocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonAppBar(
      bottom: CupertinoButton(
        onPressed: () {
          if (!isFilled) return;
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PasswordScreen()));
        },
        color: isFilled ? Colors.black : Colors.grey.shade500,
        child: const Text("Next"),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size32),
        child: Column(
          children: [
            const Text(
              "We sent you a code",
              style: TextStyle(
                  fontSize: Sizes.size24 + Sizes.size2,
                  fontWeight: FontWeight.w800),
            ),
            Gaps.v16,
            Text(
              "Enter it below to verify",
              style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Theme.of(context).disabledColor),
              textAlign: TextAlign.left,
            ),
            Text(
              widget.emailAddress,
              style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Theme.of(context).disabledColor),
              textAlign: TextAlign.left,
            ),
            Gaps.v28,
            Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged: _onChanged,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "";
                        }
                        return null;
                      },
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      cursorColor: Theme.of(context).primaryColor,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterText: '',
                        counterStyle: const TextStyle(fontSize: 0),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gaps.h10,
                  Expanded(
                    child: TextFormField(
                      onChanged: _onChanged,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "";
                        }
                        return null;
                      },
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      cursorColor: Theme.of(context).primaryColor,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterText: '',
                        counterStyle: const TextStyle(fontSize: 0),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gaps.h10,
                  Expanded(
                    child: TextFormField(
                      onChanged: _onChanged,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "";
                        }
                        return null;
                      },
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      cursorColor: Theme.of(context).primaryColor,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterText: '',
                        counterStyle: const TextStyle(fontSize: 0),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gaps.h10,
                  Expanded(
                    child: TextFormField(
                      onChanged: _onChanged,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "";
                        }
                        return null;
                      },
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      cursorColor: Theme.of(context).primaryColor,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterText: '',
                        counterStyle: const TextStyle(fontSize: 0),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gaps.h10,
                  Expanded(
                    child: TextFormField(
                      onChanged: _onChanged,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "";
                        }
                        return null;
                      },
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      cursorColor: Theme.of(context).primaryColor,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterText: '',
                        counterStyle: const TextStyle(fontSize: 0),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gaps.h10,
                  Expanded(
                    child: TextFormField(
                      onChanged: _onChanged,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "";
                        }
                        return null;
                      },
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      cursorColor: Theme.of(context).primaryColor,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterText: '',
                        counterStyle: const TextStyle(fontSize: 0),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Gaps.v16,
            FaIcon(
              FontAwesomeIcons.circleCheck,
              size: Sizes.size20,
              color: isFilled ? Colors.green : Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
