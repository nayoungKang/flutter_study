import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/sizes.dart';

//typedef NavFun = void Function(BuildContext context, StatelessWidget screen);

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon icon;
  //final NavFun navFuntion;
  final Function navFunction;

  const AuthButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.navFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navFunction.call(),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: Sizes.size10, horizontal: Sizes.size10),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.grey,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(alignment: Alignment.centerLeft, child: icon),
              Text(
                text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
