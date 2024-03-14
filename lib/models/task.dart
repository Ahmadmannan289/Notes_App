import 'package:flutter/material.dart';

class Task extends ChangeNotifier {
  final String name;
  bool isChecked;

  Task({required this.name, this.isChecked = false});

  void toggleDone() {
    isChecked = !isChecked;
  }
}
