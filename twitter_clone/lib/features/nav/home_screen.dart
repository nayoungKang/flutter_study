import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/features/nav/widgets/profile_img.dart';
import 'package:twitter_clone/features/nav/widgets/thread.dart';

class NavHomeScreen extends StatefulWidget {
  const NavHomeScreen({
    super.key,
  });

  @override
  State<NavHomeScreen> createState() => _NavHomeScreenState();
}

class _NavHomeScreenState extends State<NavHomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final Faker faker = Faker();
  // void _onScroll() {
  //   if (_scrollController.offset > 50) {
  //     if (!_showTitle) return;
  //     setState(() {
  //       _showTitle = false;
  //     });
  //   } else {
  //     setState(() {
  //       _showTitle = true;
  //     });
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _scrollController.addListener(_onScroll);
  // }

  // @override
  // void dispose() {
  //   _scrollController.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(FontAwesomeIcons.thumbsUp),
        surfaceTintColor: Colors.white,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: const Column(
          children: [
            // ThreadScrollable(
            //   width: 200,
            //   height: 150,
            //   isImgPost: true,
            // ),
            // ThreadScrollable(
            //   width: 200,
            //   height: 150,
            //   isImgPost: false,
            // ),
            // Thread(
            //   width: 200,
            //   height: 150,
            //   isImgPost: false,
            //   type: ProfileImgType.Plus,
            // ),
            Thread(
              width: 200,
              height: 150,
              isImgPost: true,
              type: ProfileImgType.Plus,
            ),
          ],
        ),
      ),
    );
  }
}
