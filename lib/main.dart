import 'package:flutter/material.dart';
import 'package:todo_flutter/Screen/todo_screen.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';


void main() => runApp(const ToDoApp());


class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (BuildContext context) => TaskData(),
      child: const MaterialApp(
        home: ToDoScreen(),
      ),
    );
  }
}
