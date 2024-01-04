import 'package:flutter/material.dart';

class MainAppBar extends AppBar {
  MainAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(title: const Text("MOOD"));
  }
}
