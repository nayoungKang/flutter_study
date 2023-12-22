import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/nav/activity/activity_screen.dart';
import 'package:twitter_clone/features/nav/home_screen.dart';
import 'package:twitter_clone/features/nav/widgets/nav_tab.dart';
import 'package:twitter_clone/features/nav/search/search_screen.dart';
import 'package:twitter_clone/features/nav/user/user_profile_screen.dart';
import 'package:twitter_clone/features/nav/write/write_screen.dart';

class NavMainScreen extends StatefulWidget {
  const NavMainScreen({super.key, required this.child});

  final Widget child;
  @override
  State<NavMainScreen> createState() => _NavMainScreenState();
}

class _NavMainScreenState extends State<NavMainScreen> {
  int _selectedIndex = 0;

  bool _writeSelected = false;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _selectedIndex == 0
        ? GoRouter.of(context).go("/")
        : _selectedIndex == 1
            ? GoRouter.of(context).go('/search')
            : _selectedIndex == 3
                ? GoRouter.of(context).go('/activity')
                : _selectedIndex == 4
                    ? GoRouter.of(context).go('/user')
                    : null;
  }

  void _onWriteClicked() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const WriteScreen();
        // return Padding(
        //   padding: const EdgeInsets.only(
        //     top: Sizes.size10,
        //     bottom: Sizes.size24,
        //     right: Sizes.size10,
        //     left: Sizes.size10,
        //   ),
        //   child: Row(
        //     children: [
        //       const CircleAvatar(
        //         radius: 18,
        //         //backgroundColor: Colors.grey,
        //         //foregroundColor: Colors.white,
        //         child: Text("Sur"),
        //       ),
        //       Gaps.h10,
        //       Expanded(
        //         child: TextField(
        //           cursorColor: Theme.of(context).primaryColor,
        //           decoration: InputDecoration(
        //             hintText: "Add comment...",
        //             border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(
        //                 Sizes.size12,
        //               ),
        //               borderSide: BorderSide.none,
        //             ),
        //             filled: true,
        //             //fillColor: Colors.grey.shade200,
        //             contentPadding: const EdgeInsets.symmetric(
        //               vertical: Sizes.size10,
        //               horizontal: Sizes.size12,
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Stack(
      //   children: [
      //     Offstage(
      //       offstage: _selectedIndex != 0,
      //       child: NavHomeScreen(
      //         showTitle: _showTitle,
      //         scrollController: _scrollController,
      //         faker: faker,
      //       ),
      //     ),
      //     Offstage(
      //       offstage: _selectedIndex != 1,
      //       child: const SearchScreen(),
      //     ),
      //     Offstage(
      //       offstage: _selectedIndex != 3,
      //       child: ActivityScreen(),
      //       // child: Navigator(
      //       //   onGenerateRoute: (routeSettings) => MaterialPageRoute(
      //       //     builder: (context) => ActivityScreen(),
      //       //     settings: const RouteSettings(name: "activity"),
      //       //   ),
      //       // ),
      //     ),
      //     Offstage(
      //       offstage: _selectedIndex != 4,
      //       child: const UserProfileScreen(),
      //     ),
      //   ],
      // ),
      body: widget.child,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: Sizes.size10),
        child: SizedBox(
          height: Sizes.size72,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavTab(
                isSelected: _selectedIndex == 0,
                icon: FontAwesomeIcons.house,
                selectedIcon: FontAwesomeIcons.house,
                onTap: () => _onTap(0),
              ),
              NavTab(
                isSelected: _selectedIndex == 1,
                icon: FontAwesomeIcons.magnifyingGlass,
                selectedIcon: FontAwesomeIcons.magnifyingGlass,
                onTap: () => _onTap(1),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _writeSelected = !_writeSelected;
                    });
                    _onWriteClicked();
                  },
                  child: Container(
                    //color: Colors.red,
                    alignment: Alignment.center,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: _writeSelected ? 1 : 0.6,
                      child: const FaIcon(
                        FontAwesomeIcons.penToSquare,
                        //color: Colors.black,
                        size: Sizes.size24,
                      ),
                    ),
                  ),
                ),
              ),
              NavTab(
                isSelected: _selectedIndex == 3,
                icon: FontAwesomeIcons.heart,
                selectedIcon: FontAwesomeIcons.heart,
                onTap: () => _onTap(3),
              ),
              NavTab(
                isSelected: _selectedIndex == 4,
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                onTap: () => _onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
