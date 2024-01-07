import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:go_router/go_router.dart';
import 'package:nomad_flutter_2nd_final/views/mood_post_screen.dart';
import 'package:nomad_flutter_2nd_final/views/moods_screen.dart';
import 'package:nomad_flutter_2nd_final/widgets/nav_tab.dart';

import '../../../constants/sizes.dart';

class MainNavScreen extends StatefulWidget {
  static const String url = '/';
  final String tab;
  const MainNavScreen({
    super.key,
    required this.tab,
  });

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  final List<String> _tabs = [
    "moods",
    "post",
  ];

  late int _selectedIndex = _tabs.indexOf(widget.tab);

  void _onTap(int index) {
    context.go("/${_tabs[index]}");
    setState(() {
      _selectedIndex = index;
    });
  }

  // _onWriteTap() {
  //   showModalBottomSheet(
  //     backgroundColor:
  //         isDarkMode(context) ? Colors.grey.shade900 : Colors.white,
  //     context: context,
  //     builder: (context) => const WriteScreen(),
  //     constraints: BoxConstraints(
  //       maxHeight: getScreenHeight(context) * 0.9,
  //     ),
  //     isScrollControlled: true,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    //final isDark = isDarkMode(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: isDark ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const MoodsScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: MoodPostScreen(),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        //color: isDark ? Colors.black : Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom + Sizes.size12,
          ),
          child: Padding(
            padding: const EdgeInsets.all(Sizes.size12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavTab(
                  isSelected: _selectedIndex == 0,
                  icon: FontAwesomeIcons.house,
                  selectedIcon: FontAwesomeIcons.house,
                  onTap: () => _onTap(0),
                  selectedIndex: _selectedIndex,
                ),
                NavTab(
                  isSelected: _selectedIndex == 1,
                  icon: FontAwesomeIcons.pen,
                  selectedIcon: FontAwesomeIcons.pen,
                  onTap: () => _onTap(1),
                  selectedIndex: _selectedIndex,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
