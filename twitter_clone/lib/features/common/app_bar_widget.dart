import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/common/twitter_icon.dart';

enum LeadingType {
  cancel,
  back,
  none;
}

extension LeadingTypeExtension on LeadingType {
  Widget intoWidget(
    BuildContext context,
  ) {
    switch (this) {
      case LeadingType.cancel:
        return GestureDetector(
          // onTap: () => Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (_) => const SignUpScreen(),
          //   ),
          // ),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.black, fontSize: Sizes.size16),
            ),
          ),
        );
      case LeadingType.back:
        return GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                FontAwesomeIcons.arrowLeft,
                color: Colors.black,
                size: 24,
              ),
            ),
          ),
        );
      case LeadingType.none:
        return const SizedBox.shrink();
      default:
        return const SizedBox.shrink();
    }
  }
}

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final LeadingType leadingType;
  final Widget? title;
  final bool showTitle;

  const AppBarWidget({
    super.key,
    required this.leadingType,
    this.title,
    this.showTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 90,
      leading: leadingType.intoWidget(context),
      title: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: showTitle ? title : const TwitterIcon(),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
