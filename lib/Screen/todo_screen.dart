import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_flutter/Widget/tasklist_widget.dart';
import 'addtask_screen.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.lightBlue,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => const AddTask(),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 30.0,
              right: 30.0,
              top: 60.0,
              bottom: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    size: 35.0,
                    color: Colors.lightBlue,
                  ),
                ),
                const SizedBox(height: 25.0),
                const Text(
                  'ToDo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  '${Provider.of<TaskData>(context).listSize} Tasks',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 400.0,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
              ),
              child: TaskList(),
            ),
          ),
        ],
      ),
    );
  }
}
