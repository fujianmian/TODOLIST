// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';
import 'package:todolist_testing/model/todo.dart';
import 'package:todolist_testing/repository/todo_API.dart';

typedef TODOSchangeListerner = Function(List<Todo>);

class LocalRepository extends TodoApi {
  static final _instance = LocalRepository._();
  final List<Todo> _todos = [];
  final List<TODOSchangeListerner> _TodoChangelisteners = [];

  LocalRepository._();
  factory LocalRepository() => _instance;

  void addChangeListener(TODOSchangeListerner listener) {
    _TodoChangelisteners.add(listener);
  }

  void removeChangeListener(TODOSchangeListerner listener) {
    _TodoChangelisteners.remove(listener);
  }

  @override
  Future<bool> ClearComplete() async {
    _todos.removeWhere((todo) => todo.isDone);
    for (final listener in _TodoChangelisteners) {
      listener.call(_todos);
    }
    return true;
  }

  @override
  Future<bool> MarkAsComplete() async {
    final newTODOs = _todos.map((e) => e.copyWith(isDone: true));
    _todos.clear();
    _todos.addAll(newTODOs);
    for (final listener in _TodoChangelisteners) {
      listener.call(_todos);
    }
    return true;
  }

  @override
  Future<bool> add(Todo todo) async {
    _todos.add(todo);
    for (final listener in _TodoChangelisteners) {
      listener.call(_todos);
    }
    return true;
  }

  @override
  Future<bool> delete(String id) async {
    _todos.removeWhere((todo) => todo.id == id);
    for (final listener in _TodoChangelisteners) {
      listener.call(_todos);
    }
    return true;
  }

  @override
  Future<List<Todo>> getTodos() async {
    return _todos;
  }

  Future<bool> update(Todo todo) async {
    _todos.removeWhere((element) => element.id == todo.id);
    _todos.add(todo);
    for (final listener in _TodoChangelisteners) {
      listener.call(_todos);
    }
    return true;
  }
}
