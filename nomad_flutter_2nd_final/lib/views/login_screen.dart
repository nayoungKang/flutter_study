import 'package:flutter/material.dart';
import 'package:nomad_flutter_2nd_final/constants/gaps.dart';
import 'package:nomad_flutter_2nd_final/constants/sizes.dart';
import 'package:nomad_flutter_2nd_final/widgets/appbar.dart';
import 'package:nomad_flutter_2nd_final/widgets/btn.dart';
import 'package:nomad_flutter_2nd_final/widgets/input_textfield.dart';

class LoginScreen extends StatelessWidget {
  static const String url = '/loginScreen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: const Center(
        child: Column(
          children: [
            Gaps.v56,
            Text(
              "Welcome",
              style: TextStyle(
                  fontSize: Sizes.size18, fontWeight: FontWeight.w600),
            ),
            Gaps.v80,
            InputTextfield(
              labeltxt: 'Email',
            ),
            Gaps.v10,
            InputTextfield(
              labeltxt: 'Password',
            ),
            Gaps.v28,
            Btn(
              txt: "Enter",
            )
          ],
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: Btn(txt: "Create account"),
      ),
    );
  }
}
