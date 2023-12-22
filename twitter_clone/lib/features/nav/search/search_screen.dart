import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/nav/search/widgets/profile_tile.dart';
import 'package:twitter_clone/features/nav/widgets/profile_img.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Search",
              style: TextStyle(
                  fontSize: Sizes.size28, fontWeight: FontWeight.w600),
            ),
            const CupertinoSearchTextField(),
            for (var i = 0; i < 10; i++)
              ProfileTile(
                type: ProfileImgType.Non,
              )
          ],
        ),
      ),
    );
  }
}
