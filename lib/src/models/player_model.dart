import 'package:flutter/material.dart';

class PlayerModel extends ChangeNotifier {
  bool _isPlaying = false;

  Duration _songDuration = new Duration(microseconds: 0);
  Duration _currentSongTime = new Duration(microseconds: 0);

  AnimationController? _controller;

  set controller(AnimationController? newAnimationController) {
    this._controller = newAnimationController;
  }

  AnimationController? get controller => this._controller;

  set isPlaying(bool newValue) {
    this._isPlaying = newValue;
    notifyListeners();
  }

  bool get isPlaying => this._isPlaying;

  set songDuration(Duration newValue) => this._songDuration = newValue;
  Duration get songDuration => this._songDuration;

  set currentSongTime(Duration newValue) => this._currentSongTime = newValue;
  Duration get currentSongTime => this._currentSongTime;

  double get songPercentage => this._songDuration.inSeconds > 0
      ? this._currentSongTime.inSeconds / this._songDuration.inSeconds
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

  String get totalSongDuration => this.printCurrentDuration(this._songDuration);
  String get currentSongDuration =>
      this.printCurrentDuration(this._currentSongTime);
}
