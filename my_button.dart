// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  VoidCallback onpressed;
  final String buttonName;
  MyButton({super.key, required this.buttonName, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      color: Colors.limeAccent[100],
      child: Text(buttonName),
    );
  }
}
