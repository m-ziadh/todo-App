import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:todo_flutter/models/task_data.dart';
import 'package:todo_flutter/models/task.dart';

Alert DeleteAlert(BuildContext context, Task task, TaskData taskData) {
  return Alert(
    context: context,
    type: AlertType.warning,
    title: "Delete Task",
    desc: task.title,
    buttons: [
      DialogButton(
        child: const Text(
          'Confirm',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        onPressed: () {
          taskData.deleteTask(task);
          Navigator.pop(context);
        },
        color: Colors.red,
      ),
      DialogButton(
        child: const Text(
          'Cancel',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        onPressed: () => Navigator.pop(context),
        color: Colors.grey,
      )
    ],
  );
}
