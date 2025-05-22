// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todo/src/feat/main_page/domain/todo.dart';

final dioProvider = Provider<Dio>((ref) {
  Dio dio = Dio(BaseOptions());

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      return handler.next(options);
    },
    onError: (error, handler) {},
    onResponse: (response, handler) {},
  ));

  dio.interceptors.add(CustomInterceptor());
  return dio;
});

class CustomInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);

    print(response.data);

    handler.resolve(response);
    handler.next(response);
  }
}

final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  // if()
  return ApiTodoRepository(httpClient: HttpClient());
});

abstract class TodoRepository {
  Future<List<Todo>> getTodos();

  Future<void> createTodo(Todo todo);

  Future<void> deleteTodo(Todo todo);
}

class ApiTodoRepository implements TodoRepository {
  final HttpClient httpClient;
  ApiTodoRepository({
    required this.httpClient,
  });
  @override
  Future<void> createTodo(Todo todo) async {}

  @override
  Future<void> deleteTodo(Todo todo) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getTodos() {
    // TODO: implement getTodos
    throw UnimplementedError();
  }
}

class LocalTodoRepository implements TodoRepository {
  final DB db;
  LocalTodoRepository({
    required this.db,
  });

  @override
  Future<void> createTodo(Todo todo) {
    // TODO: implement createTodo
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTodo(Todo todo) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getTodos() {
    // TODO: implement getTodos
    throw UnimplementedError();
  }
}

abstract class DB {}
