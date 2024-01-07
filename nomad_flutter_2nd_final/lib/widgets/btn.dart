import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  final void Function(BuildContext) onTap;
  final String txt;
  const Btn({
    super.key,
    required this.txt,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 80,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              // color: Colors.grey.withOpacity(0.7),
              spreadRadius: 0,
              // blurRadius: 5.0,
              offset: Offset(5, 5), // changes position of shadow
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(45)),
          border: Border.all(),
        ),
        child: Text(
          txt,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
