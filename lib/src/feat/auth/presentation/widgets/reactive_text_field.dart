// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReactiveTextField extends ConsumerStatefulWidget {
  const ReactiveTextField({
    super.key,
    required this.label,
    this.errorText,
    required this.onChanged,
  });

  final String label;
  final String? errorText;

  final void Function(String) onChanged;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ReactiveTextFieldState();
}

class _ReactiveTextFieldState extends ConsumerState<ReactiveTextField> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();

    controller.addListener(() {
      widget.onChanged(controller.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(widget.label),
        errorText: widget.errorText,
      ),
    );
  }
}
