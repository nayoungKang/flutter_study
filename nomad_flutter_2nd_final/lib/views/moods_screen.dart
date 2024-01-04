import 'package:flutter/material.dart';
import 'package:nomad_flutter_2nd_final/constants/gaps.dart';
import 'package:nomad_flutter_2nd_final/constants/sizes.dart';
import 'package:nomad_flutter_2nd_final/widgets/appbar.dart';
import 'package:nomad_flutter_2nd_final/widgets/mood_card.dart';

class MoodsScreen extends StatefulWidget {
  static const String url = '/moods';
  const MoodsScreen({super.key});

  @override
  State<MoodsScreen> createState() => _MoodsScreenState();
}

class _MoodsScreenState extends State<MoodsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.size18),
          child: Column(
            children: [
              MoodCard(),
              MoodCard(),
            ],
          ),
        ),
      ),
    );
  }
}
