import 'package:flutter/material.dart';
import 'package:todo_app/models/task_data.dart';
import 'package:provider/provider.dart';

class TaskTile extends StatelessWidget {
  final String textTitle;
  final bool isChecked;
  final ValueChanged<bool?> checkboxCallback;
  final VoidCallback longPressCallBack;

  TaskTile(
      {required this.textTitle,
      required this.isChecked,
      required this.checkboxCallback,
      required this.longPressCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$textTitle',
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null)),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (value) {
          checkboxCallback(value);
        },
      ),
      onLongPress: longPressCallBack,
    );
  }
}
