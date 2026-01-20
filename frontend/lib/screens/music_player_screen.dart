import 'package:flutter/material.dart';
import 'package:frontend/providers/music_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/music/album_cover.dart';
import '../widgets/music/equalizer.dart';
import '../widgets/music/lyrics_display.dart';

class MusicPlayerScreen extends StatelessWidget {
  const MusicPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('음악 플레이어'),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: Consumer<MusicProvider>(
          child: const Column(
            children: [
              SizedBox(height: 20),
              AlbumCover(),
              SizedBox(height: 20),
              LyricsDisplay(),
              SizedBox(height: 20),
              Equalizer(),
            ],
          ),
          builder: (context, musicProvider, child) {
            return Container(
                alignment: Alignment.center,
                width: 600,
                height: 1500,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent, width: 2),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${musicProvider.currentSong}"),
                    Icon(musicProvider.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow),
                    LinearProgressIndicator(value: musicProvider.progress/100),
                    child!,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            musicProvider.previousSong();
                          },
                          icon: const Icon(Icons.skip_previous),
                        ),
                        IconButton(
                          onPressed: () {
                            musicProvider.togglePlay();
                          },
                          icon: Icon(
                            musicProvider.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            musicProvider.nextSong();
                          },
                          icon: const Icon(Icons.skip_next_rounded),
                        ),
                      ],
                    ),
                  ],
                ));
          },
        ));
  }
}
