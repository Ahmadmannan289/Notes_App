import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todo_app/models/task_data.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Task_Data>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task_number = taskData.tasks[index];

          return TaskTile(
              textTitle: task_number.name,
              isChecked: task_number.isChecked,
              longPressCallBack: () {
                deleteData(index, context);
              },
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task_number);
              });
        },
        itemCount: taskData.taskCount,
      );
    });
  }

  deleteData(int index, BuildContext context) {
    // set up the buttons
    Widget deleteText = TextButton(
      onPressed: () {
        Provider.of<Task_Data>(context, listen: false).deleteTask(index);
        Navigator.pop(context);
      },
      child: Text('Yes'),
    );
    Widget canceldialog = TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text('No'),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Warning"),
      content: Text("Delete this Note?"),
      actions: [
        deleteText,
        canceldialog,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
