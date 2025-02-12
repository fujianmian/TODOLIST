import 'package:todolist_testing/model/todo.dart';

abstract class TodoApi {
  Future<bool> add(Todo todo);
  Future<bool> delete(String id);
  Future<bool> MarkAsComplete();
  Future<bool> ClearComplete();
  Future<List<Todo>> getTodos();
}
