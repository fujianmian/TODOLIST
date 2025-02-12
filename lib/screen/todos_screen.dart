import 'package:flutter/material.dart';
import 'package:todolist_testing/widget/todoFilter.dart';
import 'package:todolist_testing/widget/todo_option_button.dart';

class todoScreen extends StatefulWidget {
  const todoScreen({Key? key}) : super(key: key);

  @override
  State<todoScreen> createState() {
    return _todoScreenState();
  }
}

class _todoScreenState extends State<todoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('待完成事項'),
        backgroundColor: Colors.blue,
        actions: [Todofilter(), TodoOptionButton()],
      ),
      body: const Center(
        child: Text('Todos Screen'),
      ),
    );
  }
}
