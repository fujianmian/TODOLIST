import 'package:flutter/material.dart';
import 'package:todolist_testing/model/todo.dart';

class Todolisttile extends StatelessWidget {
  final Todo todo;
  final VoidCallback? onTodoTap;

  const Todolisttile({Key? key, required this.todo, required this.onTodoTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTodoTap,
      leading: Checkbox(
        value: todo.isDone,
        onChanged: (value) {
          // todo.isDone = value!;
        },
      ),
      title: Text(
        todo.title,
      ),
      subtitle: Text(todo.description),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
