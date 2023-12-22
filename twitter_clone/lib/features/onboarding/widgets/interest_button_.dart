import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/sizes.dart';

class Interest_Button extends StatefulWidget {
  final Function notifyIncrement;
  final Function notifyDiscrement;
  bool isChecked = false;

  Interest_Button({
    super.key,
    required this.interest,
    required this.notifyIncrement,
    required this.notifyDiscrement,
  });

  final String interest;

  @override
  State<Interest_Button> createState() => _Interest_ButtonState();
}

class _Interest_ButtonState extends State<Interest_Button> {
  void _onTap() {
    setState(() {
      widget.isChecked = !widget.isChecked;
    });

    widget.isChecked
        ? widget.notifyIncrement.call()
        : widget.notifyDiscrement.call();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 0),
        width: Sizes.size72 + Sizes.size96,
        height: Sizes.size80,
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size12,
          horizontal: Sizes.size16,
        ),
        decoration: BoxDecoration(
          color:
              widget.isChecked ? Theme.of(context).primaryColor : Colors.white,
          //color: Colors.amber,
          borderRadius: BorderRadius.circular(
            Sizes.size14,
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
              color: widget.isChecked ? Colors.white : Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
