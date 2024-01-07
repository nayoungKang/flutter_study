import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nomad_flutter_2nd_final/constants/gaps.dart';
import 'package:nomad_flutter_2nd_final/constants/sizes.dart';
import 'package:nomad_flutter_2nd_final/view_models/login_view_model.dart';
import 'package:nomad_flutter_2nd_final/views/signup_screen.dart';
import 'package:nomad_flutter_2nd_final/widgets/appbar.dart';
import 'package:nomad_flutter_2nd_final/widgets/btn.dart';
import 'package:nomad_flutter_2nd_final/widgets/input_textfield.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const String url = '/login';
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  String? _email;
  String? _password;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void _onCreateAccountTap(BuildContext context) {
    GoRouter.of(context).go(SignUpScreen.url);
  }

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {
        _email = emailController.text;
      });
    });
    passwordController.addListener(() {
      setState(() {
        _password = passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onEnterTap(BuildContext context) async {
    await ref.read(loginProvider.notifier).login(_email!, _password!, context);
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
              "Welcome",
              style: TextStyle(
                  fontSize: Sizes.size18, fontWeight: FontWeight.w600),
            ),
            Gaps.v80,
            InputTextfield(
              controller: emailController,
              isobscure: false,
              labeltxt: 'Email',
            ),
            Gaps.v10,
            InputTextfield(
              controller: passwordController,
              isobscure: true,
              labeltxt: 'Password',
            ),
            Gaps.v28,
            Btn(
              onTap: _onEnterTap,
              txt: "Enter",
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: Btn(
          txt: "Create account",
          onTap: _onCreateAccountTap,
        ),
      ),
    );
  }
}
