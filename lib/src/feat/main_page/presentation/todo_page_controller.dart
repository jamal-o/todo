// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/src/feat/main_page/domain/todo.dart';
import 'package:todo/src/feat/main_page/service/todo_service.dart';

final todoPageControllerProvider =
    NotifierProvider<TodoPageController, ListPageState>(TodoPageController.new);

class TodoPageController extends Notifier<ListPageState> {
  @override
  build() {
    return const ListPageState(userName: 'test', todoList: []);
  }
  //crud

  createTodo() {
    // ref.read(todoServiceProvider.notifier).createTodo(T: T);
  }

  updateTodo() {}

  deleteTodo(String id) {
    //request to the backend

    //successfull request

    state = state.copyWith(
        todoList: state.todoList.where((todo) => todo.id != id).toList());
  }

  fetchTodo() {}
}

@immutable
class ListPageState {
  final String userName;
  final List<Todo> todoList;

  const ListPageState({
    required this.userName,
    required this.todoList,
  });

  ListPageState copyWith({
    String? userName,
    List<Todo>? todoList,
  }) {
    return ListPageState(
      userName: userName ?? this.userName,
      todoList: todoList ?? this.todoList,
    );
  }
}

extension ListPageStateExtension on ListPageState {
  int get completeTodoCount => todoList.where((todo) => todo.status).length;
}
