// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todo/src/feat/main_page/domain/todo.dart';
import 'package:todo/src/feat/main_page/presentation/todo_page_controller.dart';



class TodoListPage extends ConsumerStatefulWidget {
  const TodoListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoListPageState();
}

class _TodoListPageState extends ConsumerState<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(todoPageControllerProvider);

    var userName = ref.watch(todoPageControllerProvider.select(
      (value) => value.userName,
    ));

    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TodoCard(
            todo: state.todoList[index],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(todoPageControllerProvider.notifier).createTodo();
        },
      ),
    );
  }
}

class TodoCard extends ConsumerWidget {
  const TodoCard({required this.todo, super.key});

  final Todo todo;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(todo.title),
      subtitle: Text(todo.description),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          ref.read(todoPageControllerProvider.notifier).deleteTodo(todo.id);
        },
      ),
    );
  }
}
// //provider - values that never change in the app

// final userProvider = Provider<String>((ref) {
//   return "Username";
// });

// //repository
// //dio class
// //http client

// //state notifier - handle state
// //state notifier provider

// final testProvider = StateNotifierProvider<TesstNotifier, int>((ref) {
//   return TesstNotifier();
// });

// class TesstNotifier extends StateNotifier<int> {
//   TesstNotifier(): super(0);

//   void increment(){
//     state++;

//   }
// }

// //notifier
// final tesProvider = NotifierProvider<TesNotifier,int >(TesNotifier.new);

// class TesNotifier extends Notifier<int> {
//   @override
//    build() {
//     return 0;
//   }

//   void increment(){
//     ref.read(testProvider.notifier).increment();
//     state++;
//   }
// }

// //async notifier

// final tesAsyncProvider = AsyncNotifierProvider<TesAsyncNotifier,int >(TesAsyncNotifier.new);
// class TesAsyncNotifier extends AsyncNotifier<int> {
//   @override
//   FutureOr<int> build() async{
//     await Future.delayed(Durations.extralong1);
//     return 4;
//   }
// }

// //families
// final familyProvider = NotifierProviderFamily<XFamilyNotifier, String , String >(XFamilyNotifier.new);

// class XFamilyNotifier extends FamilyNotifier<String,String > {
//   @override
//    build( arg) {
//     return "$arg Hello";
//   }
// }

// //future

// //stream
