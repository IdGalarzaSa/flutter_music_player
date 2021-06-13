import 'package:flutter/material.dart';

class PlayerModel extends ChangeNotifier {
  bool _isPlaying = false;

  AnimationController? _controller;

  set controller(AnimationController? newAnimationController) {
    this._controller = newAnimationController;
  }

  AnimationController? get controller => this._controller;
}
