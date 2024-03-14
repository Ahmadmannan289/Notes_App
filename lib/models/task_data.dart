import 'package:flutter/cupertino.dart';
import 'task.dart';
import 'package:flutter/material.dart';
import 'dart:collection';

class Task_Data extends ChangeNotifier {
  List<Task> _task = [
    // Task(name: 'Buy milk', isChecked: false),
    // Task(name: 'Buy eggs', isChecked: false),
    // Task(name: 'Buy bread', isChecked: false),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_task);
  }

  void addTask(String newTask) {
    Task new_Task = Task(name: newTask);
    _task.add(new_Task);
    notifyListeners();
  }

  void toggleChecked(int index) {
    _task[index].toggleDone();
  }

  int get taskCount {
    return _task.length;
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(int text) {
    _task.removeAt(text);
    notifyListeners();
  }
}
