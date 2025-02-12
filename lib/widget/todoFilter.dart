import 'package:flutter/material.dart';
import 'package:todolist_testing/model/todo_filteroption.dart';

class Todofilter extends StatelessWidget {
  const Todofilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        child: const Icon(Icons.filter_list_rounded),
        itemBuilder: (context) {
          return const [
            PopupMenuItem<TodoFilteroption>(
                value: TodoFilteroption.all, child: Text('全部')),
            PopupMenuItem<TodoFilteroption>(
                value: TodoFilteroption.active, child: Text('还未完成')),
            PopupMenuItem<TodoFilteroption>(
                value: TodoFilteroption.completed, child: Text('已完成')),
          ];
        });
  }
}
