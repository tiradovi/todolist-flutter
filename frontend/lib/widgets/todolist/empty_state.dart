import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final IconData icon;
  final String mainText;
  final String subText;

  const EmptyState({
    super.key,
    required this.icon,
    required this.mainText,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_outlined, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text('No todos yet', style: TextStyle(fontSize: 20, color: Colors.grey[600])),
          const SizedBox(height: 8),
          Text('Tap + to add a new todo', style: TextStyle(fontSize: 14, color: Colors.grey[500])),
        ],
      ),
    );
  }
}