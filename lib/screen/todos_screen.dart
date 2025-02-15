import 'package:flutter/material.dart';
import 'package:todolist_testing/model/todo.dart';
import 'package:todolist_testing/repository/local_repository.dart';
import 'package:todolist_testing/repository/todo_API.dart';
import 'package:todolist_testing/screen/editTodo_screen.dart';
import 'package:todolist_testing/widget/todoFilter.dart';
import 'package:todolist_testing/widget/todo_list_title.dart';
import 'package:todolist_testing/widget/todo_option_button.dart';

class todoScreen extends StatefulWidget {
  const todoScreen({Key? key}) : super(key: key);

  @override
  State<todoScreen> createState() {
    return _todoScreenState();
  }
}

class _todoScreenState extends State<todoScreen> {
  final List<Todo> todos = [];
  final _todoApi = LocalRepository();
  TODOSchangeListerner? _TodoChangelistener;

  void initState() {
    super.initState();

    _init();
  }

  void _init() async {
    final fetchedTodos = await _todoApi.getTodos();
    setState(() {
      todos.addAll(fetchedTodos);
    });

    _todoApi.addChangeListener((newTodos) {
      setState(() {
        todos.addAll(newTodos);
      });
    });
    _TodoChangelistener = (updatedTodos) {
      setState(() {
        todos.clear();
        todos.addAll(updatedTodos);
      });
    };
    _todoApi.addChangeListener(_TodoChangelistener!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('待完成事項'),
        backgroundColor: Colors.blue,
        actions: [Todofilter(), TodoOptionButton()],
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return Todolisttile(
            todo: todo,
            onTodoTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EdittodoScreen(todo: todo);
              }));
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    if (_TodoChangelistener != null) {
      _todoApi.removeChangeListener(_TodoChangelistener!);
      _TodoChangelistener = null;
    }
    super.dispose();
  }
}
