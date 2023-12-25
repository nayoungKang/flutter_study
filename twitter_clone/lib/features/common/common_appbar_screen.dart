import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommonAppBar extends StatefulWidget {
  final Widget child;
  final Widget? bottom;
  const CommonAppBar({super.key, required this.child, required this.bottom});

  @override
  State<CommonAppBar> createState() => _CommonAppBarScreenState();
}

class _CommonAppBarScreenState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,

      appBar: AppBar(
          title: FaIcon(
        FontAwesomeIcons.twitter,
        color: Theme.of(context).primaryColor,
      )),
      body: widget.child,
      //bottomNavigationBar: widget.bottom,
      bottomSheet: widget.bottom,
    );
  }
}
