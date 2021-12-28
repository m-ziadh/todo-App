import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

  final String title;
  final bool isChecked;
  final Function toogleBox;
  final Function longPressDelete;
  const TaskTile({required this.title, required this.isChecked , required this.toogleBox, required this.longPressDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: (){
        longPressDelete();
      },
      title: Text(
        title,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
          fontSize: 16.0,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: (value){
          toogleBox(value);
        },
      ),
    );
  }
}