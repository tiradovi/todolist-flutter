import 'package:flutter/material.dart';

class StatisticsBar extends StatelessWidget {
  final int totalCount;
  final int activeCount;
  final int completedCount;

  const StatisticsBar({
    super.key,
    required this.totalCount,
    required this.activeCount,
    required this.completedCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        StatCard(
          label: 'Total',
          count: totalCount.toString(),
          color: Colors.blue,
        ),
        StatCard(
          label: 'Active',
          count: activeCount.toString(),
          color: Colors.orange,
        ),
        StatCard(
          label: 'Done',
          count: completedCount.toString(),
          color: Colors.green,
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final String label;
  final String count;
  final Color color;

  const StatCard({
    super.key,
    required this.label,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
