import 'package:flutter/material.dart';

class PlayerModel extends ChangeNotifier {
  bool _isPlaying = false;

  Duration _totalSongDuration = new Duration(microseconds: 0);
  Duration _currentSongDuration = new Duration(microseconds: 0);

  AnimationController? _controller;

  // animation controller
  set controller(AnimationController? newAnimationController) {
    this._controller = newAnimationController;
  }

  AnimationController? get controller => this._controller;

  // is playing
  set isPlaying(bool newValue) {
    this._isPlaying = newValue;
    notifyListeners();
  }

  bool get isPlaying => this._isPlaying;

  // total song duration
  set totalSongDuration(Duration newValue) {
    this._totalSongDuration = newValue;
    notifyListeners();
  }

  Duration get totalSongDuration => this._totalSongDuration;

  // current song duration
  set currentSongDuration(Duration newValue) {
    this._currentSongDuration = newValue;
    notifyListeners();
  }

  Duration get currentSongDuration => this._currentSongDuration;

  // extras
  double get songPercentage => this._totalSongDuration.inSeconds > 0
      ? this._currentSongDuration.inSeconds / this._totalSongDuration.inSeconds
      : 0;

  String printCurrentDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitsMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitsSeconds = twoDigits(duration.inSeconds.remainder(60));

    return '$twoDigitsMinutes:$twoDigitsSeconds';
  }

  String get totalSongDurationAsString =>
      this.printCurrentDuration(this._totalSongDuration);
  String get currentSongDurationAsString =>
      this.printCurrentDuration(this._currentSongDuration);
}
