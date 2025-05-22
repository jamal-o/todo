// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/src/feat/main_page/presentation/create_page.dart';


final createTodoPageController =
    NotifierProvider<CreateNotifier, CreateState>(CreateNotifier.new);

class CreateNotifier extends Notifier<CreateState> {
  @override
  build() {
    return CreateState(
      description: null,
      title: null,
      status: null,
    );
  }

  Future<void> createTodo({
    required String title,
    required String description,
    required bool status,
  }) async {}
}


class CreateState {
  final String? description;
  final String? title;
  final bool? status;

  CreateState({
    required this.description,
    required this.title,
    required this.status,
  });

  CreateState copyWith({
    String? description,
    String? title,
    bool? status,
  }) {
    return CreateState(
      description: description ?? this.description,
      title: title ?? this.title,
      status: status ?? this.status,
    );
  }
}
