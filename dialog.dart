// ignore_for_file: prefer_const_constructors, must_be_immutable, non_constant_identifier_names, prefer_typing_uninitialized_variables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:jodel/util/my_button.dart';

class DialogPage extends StatelessWidget {
  final Controller;
  VoidCallback saveNewTask;
  VoidCallback cancelTask;
  DialogPage(
      {super.key,
      required this.Controller,
      required this.saveNewTask,
      required this.cancelTask});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Container(
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            controller: Controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Add new task"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //

              MyButton(buttonName: "Save", onpressed: saveNewTask),
              const SizedBox(
                width: 4,
              ),

              MyButton(buttonName: "Cancel", onpressed: cancelTask)
            ],
          )
        ],
      ),
    ));
  }
}
