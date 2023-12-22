import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/sizes.dart';

enum Genre {
  Fashion,
  Outdoors,
  Arts,
  Animation,
  Business,
  Food,
  Travel,
  Entertainment,
  Music,
  Gaming
}

class SubInterestButton extends StatefulWidget {
  final Function notifyIncrement;
  final Function notifyDiscrement;
  final String interest;

  const SubInterestButton({
    super.key,
    required this.interest,
    required this.notifyIncrement,
    required this.notifyDiscrement,
  });

  @override
  State<SubInterestButton> createState() => _SubInterestButtonState();
}

class _SubInterestButtonState extends State<SubInterestButton> {
  bool isChecked = false;
  void _onTap() {
    print(isChecked);
    setState(() {
      isChecked = !isChecked;
    });

    print(isChecked);

    isChecked ? widget.notifyIncrement.call() : widget.notifyDiscrement.call();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 0),
        height: Sizes.size44,
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size12,
          horizontal: Sizes.size16,
        ),
        decoration: BoxDecoration(
          color: isChecked ? Theme.of(context).primaryColor : Colors.white,
          //color: Colors.amber,
          borderRadius: BorderRadius.circular(
            Sizes.size32,
          ),
          border: Border.all(color: Colors.black.withOpacity(0.1)),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            widget.interest,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Sizes.size14,
              color: isChecked ? Colors.white : Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
