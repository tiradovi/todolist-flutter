import 'package:flutter/cupertino.dart';

class MusicProvider with ChangeNotifier {
  bool _isPlaying = false;
  int _progress = 0;
  String _currentSong = "노래 1";
  int _songIndex = 1;

  bool get isPlaying => _isPlaying;
  int get progress => _progress;
  String? get currentSong => _currentSong;
  int get songIndex => _songIndex;

  void togglePlay() {
    _isPlaying = _isPlaying ? false : true;
    notifyListeners();
  }

  void nextSong() {
    _songIndex++;
    _currentSong = "노래$_songIndex";
    notifyListeners();
  }

  void previousSong() {
    _songIndex--;
    _currentSong = "노래";
    notifyListeners();
  }

  void updateProgress(int value) {
    _progress += value;
    notifyListeners();
  }
}
