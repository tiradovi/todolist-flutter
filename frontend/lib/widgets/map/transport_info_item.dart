import 'package:flutter/material.dart';

class TransportInfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String info;

  const TransportInfoItem(
      {super.key, required this.icon, required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.blue),
        const SizedBox(width: 8),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            Text(
              info,
              style: TextStyle(fontSize: 13, color: Colors.grey[700]),
            )
          ],
        ))
      ],
    );
  }
}
