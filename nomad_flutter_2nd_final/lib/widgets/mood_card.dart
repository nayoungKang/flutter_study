import 'package:flutter/material.dart';
import 'package:nomad_flutter_2nd_final/constants/gaps.dart';
import 'package:nomad_flutter_2nd_final/constants/sizes.dart';

class MoodCard extends StatelessWidget {
  const MoodCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size20, vertical: Sizes.size10),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                // color: Colors.grey.withOpacity(0.7),
                spreadRadius: 0,
                // blurRadius: 5.0,
                offset: Offset(-2, 2), // changes position of shadow
              ),
            ],
            border: Border.all(width: Sizes.size2),
            borderRadius: BorderRadius.circular(Sizes.size28),
            color: Theme.of(context).secondaryHeaderColor,
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("mood:"),
              Gaps.v10,
              Text(
                  "Today was first day of my third job. Before I went into the building, it was,, but finally it was great."),
            ],
          ),
        ),
        Gaps.v10,
        const Text("1 day ago")
      ],
    );
  }
}
