import 'package:flutter/material.dart';

class InputTextfield extends StatelessWidget {
  final TextEditingController controller;
  //final Function(String) listener;
  final String labeltxt;
  final bool isobscure;
  const InputTextfield({
    super.key,
    required this.labeltxt,
    required this.isobscure,
    required this.controller,
    //required this.listener,
  });

  @override
  Widget build(BuildContext context) {
    //controller.addListener(listener(controller.text));
    return SizedBox(
      width: 200,
      height: 50,
      child: TextField(
        controller: controller,
        obscureText: isobscure,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(45))),
          labelText: labeltxt,
        ),
      ),
    );
  }
}
