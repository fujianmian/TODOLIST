import 'package:todolist_testing/model/todo.dart';
import 'package:todolist_testing/repository/todo_API.dart';

class LocalRepository extends TodoApi {
  static final _instance = LocalRepository._();
  final List<Todo> _todos = [];

  LocalRepository._();
  factory LocalRepository() => _instance;

  @override
  Future<bool> ClearComplete() async {
    _todos.removeWhere((todo) => todo.isDone);
    return true;
  }

  @override
  Future<bool> MarkAsComplete() async {
    final newTODOs = _todos.map((e) => e.copyWith(isDone: true));
    _todos.clear();
    _todos.addAll(newTODOs);
    return true;
  }

  @override
  Future<bool> add(Todo todo) async {
    _todos.add(todo);
    return true;
  }

  @override
  Future<bool> delete(String id) async {
    _todos.removeWhere((todo) => todo.id == id);
    return true;
  }

  @override
  Future<List<Todo>> getTodos() async {
    return _todos;
  }

  Future<bool> update(Todo todo) async {
    _todos.removeWhere((element) => element.id == todo.id);
    _todos.add(todo);
    return true;
  }
}
