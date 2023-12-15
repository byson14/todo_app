// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskChanged;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskChanged,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(12),
            onPressed: deleteFunction,
            backgroundColor: Colors.redAccent,
            icon: Icons.delete,
          )
        ]),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Checkbox(value: taskChanged, onChanged: onChanged),
                Text(
                  taskName,
                  style: TextStyle(
                      fontSize: 20,
                      decoration: taskChanged
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
