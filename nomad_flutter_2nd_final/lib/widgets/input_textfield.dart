import 'package:flutter/material.dart';

class InputTextfield extends StatelessWidget {
  final String labeltxt;
  const InputTextfield({
    super.key,
    required this.labeltxt,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(45))),
          labelText: labeltxt,
        ),
      ),
    );
  }
}
