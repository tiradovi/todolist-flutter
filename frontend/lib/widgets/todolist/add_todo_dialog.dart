import 'package:flutter/material.dart';

class AddTodoDialog extends StatefulWidget {
  final Function(String) onAdd;

  const AddTodoDialog({super.key, required this.onAdd});

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  final TextEditingController _controller = TextEditingController();

  void _handleAdd() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      widget.onAdd(text);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('New Todo'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(
          hintText: 'What needs to be done?',
          border: OutlineInputBorder(),
        ),
        autofocus: true,
        maxLines: 3,
        onSubmitted: (_)=> _handleAdd(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => _handleAdd(),
          child: const Text('Add'),
        ),
      ],
    );
  }
}
