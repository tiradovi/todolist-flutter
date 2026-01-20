import 'package:flutter/material.dart';

class LyricsDisplay extends StatelessWidget {
  const LyricsDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 400,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        border: Border.all(color: Colors.blue, width: 3),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('가사 표시', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('가사가사가사가사가사가사가사가사가사가사가사가사가사가사가사가사가사\n'
                '가사가사가사가사가사가사가사가사가사가사가사가사가사가사가사가사가사')
          ],
        ),
      ),
    );
  }
}