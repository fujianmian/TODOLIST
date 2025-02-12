import 'package:flutter/material.dart';
import 'package:todolist_testing/model/todo_filteroption.dart';
import 'package:todolist_testing/model/todo_option_option.dart';

class TodoOptionButton extends StatelessWidget {
  const TodoOptionButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(itemBuilder: (context) {
      return const [
        PopupMenuItem<TodoOptionOption>(
            value: TodoOptionOption.MarkAsCompleted, child: Text('标记全部为完成')),
        PopupMenuItem<TodoOptionOption>(
            value: TodoOptionOption.ClearCompleted, child: Text('标记全部为未完成')),
      ];
    });
  }
}
