// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/src/feat/main_page/presentation/create_page_controller.dart';


class CreatePage extends ConsumerStatefulWidget {
  const CreatePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreatePageState();
}

class _CreatePageState extends ConsumerState<CreatePage> {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          //title

          TextFormField(
            controller: titleController,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),

          //description
          TextFormField(
            controller: descriptionController,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          //save
          ElevatedButton(
            child: const Text("Save"),
            onPressed: () {
              if (titleController.text.isEmpty ||
                  descriptionController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Please fill all the fields"),
                  ),
                );
                return;
              }
              ref.read(createTodoPageController.notifier).createTodo(
                    title: titleController.text,
                    description: descriptionController.text,
                    status: true,
                  );
            },
          ),
          //status
        ],
      ),
    );
  }
}

//Result<Success, Failure> createTodo({
//   required String title,
//   required String description,
//   required bool status,
// })

//UIResponse // boolean succes or failure field for message