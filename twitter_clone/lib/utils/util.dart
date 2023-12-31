import 'package:flutter/material.dart';

bool isDarkMode(BuildContext context) =>
    MediaQuery.of(context).platformBrightness == Brightness.dark;

double mediaHeight(BuildContext context) => MediaQuery.of(context).size.height;
