import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/auth/confirm_code_screen.dart';

import 'package:twitter_clone/features/auth/term_allow_screen.dart';
import 'package:twitter_clone/features/auth/widgets/form_button.dart';
import 'package:twitter_clone/features/common/common_appbar_screen.dart';

class PersonalInputScreen extends StatefulWidget {
  const PersonalInputScreen({super.key});

  @override
  State<PersonalInputScreen> createState() => _PersonalInputScreenState();
}

class _PersonalInputScreenState extends State<PersonalInputScreen> {
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  String? name = '';
  String? email = '';
  bool birthPicked = false;
  bool namePicked = false;
  bool emailPicked = false;

  bool allowed = false;

  DateTime initialDate = DateTime.now();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        email = _emailController.text;
      });
    });
    _nameController.addListener(() {
      setState(() {
        name = _nameController.text;
      });
    });
    //_setTextFieldDate(initialDate);
  }

  _onNextTap() async {
    if (email!.isEmpty || name!.isEmpty) return;
    if (allowed) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmationCodeScreen(
            emailAddress: email!,
          ),
        ),
      );
    } else {
      allowed = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const TermAllowScreen(),
            fullscreenDialog: true),
      );
    }

    setState(() {});
  }

  String? emailVal() {
    if (email!.isEmpty && !emailPicked) return null;
    RegExp reg = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (reg.hasMatch(email!)) {
      return null;
    }
    return "Real Email need";
  }

  void _onSacffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
    setState(() {
      birthPicked = true;
    });
  }

  void _onNameChange(String? value) {
    setState(() {
      name = value;
      namePicked = true;
    });
    _formKey.currentState?.validate();
  }

  void _onEmailChange(String? value) {
    setState(() {
      email = value;
      emailPicked = true;
    });
    _formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return CommonAppBar(
      bottom: null,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Gaps.v14,
                  const Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: Sizes.size24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name!.isEmpty ? "" : "Name",
                          style: const TextStyle(color: Colors.black54),
                          textAlign: TextAlign.left,
                        ),
                        TextFormField(
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                            hintText: "Name",
                            suffix: name!.isEmpty
                                ? null
                                : const FaIcon(
                                    FontAwesomeIcons.check,
                                    color: Colors.green,
                                    size: Sizes.size20,
                                  ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black54,
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          validator: (value) {
                            return value!.isEmpty && namePicked
                                ? "More Characters need"
                                : null;
                          },
                          onChanged: _onNameChange,
                        ),

                        Text(
                          email!.isEmpty ? "" : "Email",
                          style: const TextStyle(color: Colors.black54),
                          textAlign: TextAlign.left,
                        ),
                        TextFormField(
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                            hintText: "Email",
                            suffix: email!.isEmpty || emailVal() != null
                                ? null
                                : const FaIcon(
                                    FontAwesomeIcons.check,
                                    color: Colors.green,
                                    size: Sizes.size20,
                                  ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black54,
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          validator: (value) {
                            return emailVal();
                          },
                          onChanged: _onEmailChange,
                        ),
                        Gaps.v28,
                        TextFormField(
                          readOnly: true,
                          controller: _birthdayController,
                          decoration: InputDecoration(
                            hintText: "Date of Birth",
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black54,
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black54,
                              ),
                            ),
                            suffix: birthPicked
                                ? const FaIcon(
                                    FontAwesomeIcons.check,
                                    color: Colors.green,
                                    size: Sizes.size20,
                                  )
                                : null,
                          ),
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  height: 300, // Just as an example
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.date,
                                    initialDateTime: DateTime.now(),
                                    maximumDate: DateTime.now(),
                                    onDateTimeChanged: _setTextFieldDate,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        // Text(
                        //   email!.isEmpty ? "" : "Email",
                        //   style: const TextStyle(color: Colors.black54),
                        //   textAlign: TextAlign.left,
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: _onNextTap,
                child: FormButton(
                  disabled: email!.isEmpty ||
                      name!.isEmpty ||
                      emailVal() != null ||
                      !birthPicked,
                  btn_title: allowed ? "Sign up" : "Next",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
