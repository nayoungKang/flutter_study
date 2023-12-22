import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';

class ConnectButtonSet extends StatelessWidget {
  const ConnectButtonSet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        FaIcon(FontAwesomeIcons.heart),
        Gaps.h14,
        FaIcon(FontAwesomeIcons.message),
        Gaps.h14,
        FaIcon(FontAwesomeIcons.refresh),
        Gaps.h14,
        FaIcon(FontAwesomeIcons.paperPlane)
      ],
    );
  }
}
