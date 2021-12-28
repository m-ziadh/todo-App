import 'package:flutter/material.dart';
import 'package:todo_flutter/models/task_data.dart';
import 'tasktile_widget.dart';
import 'package:provider/provider.dart';
import 'alert_button.dart';

class TaskList extends StatefulWidget {


  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {

  @override
  void initState() {
    super.initState();
    setState(() {
      _getLocalData();
    });
  }
  void _getLocalData() async => await TaskData().getLocalData();

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.listSize,
          padding: const EdgeInsets.all(20.0),
          itemBuilder: (context, index) {
            final task = taskData.taskList[index];
            return TaskTile(
              title: task.title,
              isChecked: task.isCheck,
              toogleBox: (bool value) {
                taskData.updateTask(task, value);
              },
              longPressDelete: () {
                DeleteAlert(context, task, taskData).show();
              },
            );
          },
        );
      },
    );
  }
}