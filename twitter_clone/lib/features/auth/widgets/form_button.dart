import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/sizes.dart';

class FormButton extends StatelessWidget {
  final String btn_title;
  const FormButton({
    super.key,
    required this.disabled,
    required this.btn_title,
  });

  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: Sizes.size8),
        decoration: BoxDecoration(
          color: disabled ? Colors.grey.shade400 : Colors.black,
          borderRadius: BorderRadius.circular(5),
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: TextStyle(
            color: disabled ? Colors.grey : Colors.white,
          ),
          child: Text(
            btn_title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
