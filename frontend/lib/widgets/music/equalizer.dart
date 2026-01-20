import 'package:flutter/material.dart';

class Equalizer extends StatelessWidget {
  const Equalizer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: 150,
        height: 150,
        child: Row(
          children: [
            Icon(Icons.bar_chart),
            Icon(Icons.bar_chart),
            Icon(Icons.bar_chart),
          ],
        ));
  }
}
