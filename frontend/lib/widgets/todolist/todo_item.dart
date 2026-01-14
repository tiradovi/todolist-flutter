import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../common/app_styles.dart';
import '../../providers/todo_provider.dart';
import '../../models/todo_model.dart';

class TodoItem extends StatelessWidget {
  final TodoModel todo;

  const TodoItem({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context, listen: false);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        leading: Checkbox(
          value: todo.isCompleted,
          onChanged: (bool? value) {
            if (value != null && todo.id != null) {
              provider.toggleTodo(todo.id!, value);
            }
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        title: Text(
          todo.content,
          style: todo.isCompleted
              ? AppTextStyles.todoCompleted
              : AppTextStyles.todoContent,
        ),
        subtitle: todo.createdAt != null
            ? Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            todo.formattedDate,
            style: AppTextStyles.todoDate,
          ),
        )
            : null,
        trailing: IconButton(
          icon: const Icon(
            Icons.delete_outline,
          ),
          onPressed: () {
            if (todo.id != null) {
              _showDeleteDialog(context, provider, todo.id!);
            }
          },
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, TodoProvider provider, int id) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Todo'),
        content: const Text('Are you sure you want to delete this todo?'),
        actions: [
          TextButton(
            onPressed: () => context.pop(ctx),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              provider.removeTodo(id);
              context.pop(ctx);
            },
            style: FilledButton.styleFrom(
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}