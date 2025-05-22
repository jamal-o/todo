import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/src/feat/main_page/data/todo_repository.dart';
import 'package:todo/src/feat/main_page/domain/todo.dart';

final todoServiceProvider =
    NotifierProvider<TodoService, TodoServiceState>(TodoService.new);

class TodoService extends Notifier<TodoServiceState> {
  @override
  build() {
    return TodoServiceState();
  }
  //crud

  createTodo({
    required Todo T,
  }) {
    ref.read(todoRepositoryProvider).createTodo(T);
  }

  updateTodo() {}

  deleteTodo(String id) {
    //request to the backend

    //successfull request
  }

  fetchTodo() {}
}

class TodoServiceState {}
