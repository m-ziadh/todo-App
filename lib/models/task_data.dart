import 'package:flutter/foundation.dart';
import 'package:todo_flutter/models/task.dart';
import 'dart:collection';
import 'package:shared_preferences/shared_preferences.dart';

class TaskData extends ChangeNotifier {

  final List<Task> _taskList = [];

  Future<void> getLocalData() async {
    int key = 0;
    while (true) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String text = prefs.getString('T$key') ?? '';
      bool check = prefs.getBool('B$key') ?? false;
      if (text != '') {
        _taskList.add(Task(title: text, isCheck: check));
        key++;
      } else {
        break;
      }
    }
    notifyListeners();
  }

  UnmodifiableListView<Task> get taskList {
    return UnmodifiableListView(_taskList);
  }

  int get listSize {
    return _taskList.length;
  }

  Future<void> addTask(String newtitle, bool check) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('T$listSize', newtitle);
    await prefs.setBool('B$listSize', false);

    _taskList.add(Task(title: newtitle, isCheck: check));
    notifyListeners();
  }

  Future<void> deleteTask(Task task) async {
    // await storage.deleteItem('${_taskList.indexOf(task)} T');
    // await storage.deleteItem('${_taskList.indexOf(task)} B');
    _taskList.remove(task);
    notifyListeners();
  }

  Future<void> updateTask(Task task, bool check) async {
    task.toggleBox(check);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    check
        ? await prefs.setBool('B${_taskList.indexOf(task)}', false)
        : await prefs.setBool('B${_taskList.indexOf(task)}', true);
    notifyListeners();
  }
}
