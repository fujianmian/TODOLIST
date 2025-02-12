import 'package:todolist_testing/model/todo.dart';
import 'package:todolist_testing/repository/todo_API.dart';

class LocalRepository extends TodoApi {
  final List<Todo> _todos = [];
  @override
  Future<bool> ClearComplete() {
    // TODO: implement ClearComplete
    throw UnimplementedError();
  }

  @override
  Future<bool> MarkAsComplete() {
    // TODO: implement MarkAsComplete
    throw UnimplementedError();
  }

  @override
  Future<bool> add(Todo todo) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getTodos() {
    // TODO: implement getTodos
    throw UnimplementedError();
  }
}
