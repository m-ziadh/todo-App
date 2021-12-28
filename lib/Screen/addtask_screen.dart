import 'package:flutter/material.dart';
import 'package:todo_flutter/models/task_data.dart';
import 'package:provider/provider.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = '';
    return Container(
      color: const Color(0xFF757575),
      child: Container(
        padding: const EdgeInsets.all(30.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              textAlign: TextAlign.center,
              autofocus: true,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
              onChanged: (value) {
                text = value;
              },
            ),
            FlatButton(
              color: Colors.lightBlue,
              onPressed: () async {
                if (text != '') {
                  await Provider.of<TaskData>(context, listen: false).addTask(text, false);
                  Navigator.pop(context);
                }
              },
              child: const Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
