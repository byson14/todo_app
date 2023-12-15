// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jodel/util/dialog.dart';
import 'package:jodel/util/todolist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List toDoList = [
    ["Make Tutorial", false],
    ["See a Movie", false]
  ];
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void onSave() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void onCancel() {
    Navigator.of(context).pop();
  }

  void removeTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  void dropDown() {
    setState(() {
      DropdownMenu(context) {
        return Container(
          height: 120,
          child: Text("Settings"),
        );
      }

      ;
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogPage(
            Controller: _controller,
            saveNewTask: onSave,
            cancelTask: onCancel,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            child: Column(
          children: [
            DrawerHeader(child: Icon(Icons.person)),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                "S E T T I N G S",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(context, '/settingsPage');
              },
            )
          ],
        )),
        appBar: AppBar(actions: [
          IconButton(
            onPressed: dropDown,
            icon: Icon(Icons.more_vert),
          )
        ], title: Center(child: Text("TO DO"))),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: toDoList[index][0],
              taskChanged: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => removeTask(index),
            );
          },
        ));
  }
}
