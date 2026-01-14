import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TodoDetailScreen extends StatelessWidget {
  final String id;
  const TodoDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: const Center(
        child: Text('TodoDetailScreen is working'),
      ),
    );
  }
}