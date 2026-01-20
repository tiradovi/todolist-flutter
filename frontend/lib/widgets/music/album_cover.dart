import 'package:flutter/material.dart';

class AlbumCover extends StatelessWidget {
  const AlbumCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        border: Border.all(color: Colors.blue, width: 3),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.music_note, size: 80, color: Colors.blue),
            Text('앨범 커버', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}