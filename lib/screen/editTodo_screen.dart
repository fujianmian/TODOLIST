import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist_testing/model/todo.dart';
import 'package:todolist_testing/repository/local_repository.dart';
import 'package:uuid/uuid.dart';

class EdittodoScreen extends StatefulWidget {
  final Todo? todo;
  const EdittodoScreen({Key? key, this.todo});

  @override
  State<EdittodoScreen> createState() {
    return _EdittodoScreenState();
  }
}

class _EdittodoScreenState extends State<EdittodoScreen> {
  String? _title;
  String? _description;

  @override
  void initState() {
    super.initState();
    final todo = widget.todo;
    _title = todo?.title;
    _description = todo?.description;
  }

  @override
  Widget build(BuildContext context) {
    final todo = widget.todo;
    return Scaffold(
        appBar: AppBar(
            title: todo == null ? const Text('添加待办事项') : const Text('编辑待办事项'),
            backgroundColor: Colors.blue),
        floatingActionButton: FloatingActionButton(
          onPressed: _title != null
              ? () {
                  if (todo == null) {
                    _addTodo();
                  } else {
                    _editTODO();
                  }
                }
              : null,
          child: const Icon(Icons.done),
        ),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                _TitleField(
                  initialValues: _title,
                  hintText: todo?.title,
                  onChanged: (value) {
                    setState(() {
                      _title = value;
                    });
                  },
                ),
                _DescriptionField(
                  initialValues: _description,
                  hintText: todo?.description,
                  onChanged: (value) {
                    setState(() {
                      _description = value;
                    });
                  },
                ),
              ],
            )));
  }

  void _addTodo() {
    final todosapi = LocalRepository();
    final id = Uuid().v4();
    final newtodo = Todo(
      id: id,
      title: _title ?? "",
      description: _description ?? "",
    );
    todosapi.add(newtodo);
    Navigator.pop(context, newtodo);
  }

  void _editTODO() {
    final todo = widget.todo;
    if (todo == null) return;
    final todosapi = LocalRepository();
    final newTodo =
        todo.copyWith(title: _title!, description: _description ?? "");
    todosapi.update(newTodo);
    Navigator.pop(context, newTodo);
  }
}

class _TitleField extends StatelessWidget {
  final String? initialValues;
  final String? hintText;
  final Function(String?)? onChanged;

  const _TitleField({this.initialValues, this.onChanged, this.hintText});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValues,
      maxLength: 50,
      maxLines: 1,
      decoration: InputDecoration(labelText: '标题', hintText: hintText),
      onChanged: onChanged,
    );
  }
}

class _DescriptionField extends StatelessWidget {
  final String? initialValues;
  final String? hintText;
  final Function(String?)? onChanged;

  const _DescriptionField({this.initialValues, this.onChanged, this.hintText});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValues,
      maxLength: 300,
      maxLines: 7,
      decoration: InputDecoration(labelText: '描述', hintText: hintText),
      onChanged: onChanged,
    );
  }
}
