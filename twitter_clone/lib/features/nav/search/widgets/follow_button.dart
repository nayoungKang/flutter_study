import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/sizes.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey.shade500,
          ),
          borderRadius: BorderRadius.circular(
            Sizes.size5,
          )),
      child: const Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Sizes.size16, vertical: Sizes.size5),
        child: Text("Follow"),
      ),
    );
  }
}
