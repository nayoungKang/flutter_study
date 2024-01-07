import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nomad_flutter_2nd_final/constants/gaps.dart';
import 'package:nomad_flutter_2nd_final/constants/sizes.dart';
import 'package:nomad_flutter_2nd_final/view_models/signup_view_model.dart';
import 'package:nomad_flutter_2nd_final/views/login_screen.dart';
import 'package:nomad_flutter_2nd_final/widgets/appbar.dart';
import 'package:nomad_flutter_2nd_final/widgets/btn.dart';
import 'package:nomad_flutter_2nd_final/widgets/input_textfield.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static const String url = '/signup';
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  String? email = '';
  String? password = '';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        email = _emailController.text;
      });
      //print("email=$email");
    });
    _passwordController.addListener(() {
      setState(() {
        password = _passwordController.text;
      });
      //print("email=$email");
    });
  }

  @override
  void dispose() {
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Center(
        child: Column(
          children: [
            Gaps.v56,
            const Text(
              "Join",
              style: TextStyle(
                  fontSize: Sizes.size18, fontWeight: FontWeight.w600),
            ),
            Gaps.v80,
            InputTextfield(
              controller: _emailController,
              isobscure: false,
              labeltxt: 'Email',
            ),
            Gaps.v10,
            InputTextfield(
              controller: _passwordController,
              isobscure: true,
              labeltxt: 'Password',
            ),
            Gaps.v28,
            Btn(
              onTap: (context) async {
                //final state = ref.read(signUpForm.notifier).state;
                ref.read(signUpForm.notifier).state = {
                  "email": email,
                  "password": password,
                };
                await ref.read(signUpProvider.notifier).signUp();

                GoRouter.of(context).go(LoginScreen.url);
              },
              txt: "Create Account",
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: Btn(txt: "Login", onTap: (context) {}),
      ),
    );
  }
}
