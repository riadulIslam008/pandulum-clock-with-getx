import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClockController extends GetxController with SingleGetTickerProviderMixin {
  @override
  void onInit() {
    timeChange();
    animationSection();
    super.onInit();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  timeChange() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      update();
    });
  }

  //
  // ─── FOR ANIMATION ──────────────────────────────────────────────────────────────
  //

  late Animation animation;
  late AnimationController _animationController;

  animationSection() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationController.addListener(() {
      if (animation.isCompleted) {
        _animationController.reverse();
      } else if (animation.isDismissed) {
        _animationController.forward();
      }
      update();
    });
    _animationController.forward();
    animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);
    animation = Tween(begin: -0.5, end: 0.5).animate(_animationController);
  }
}
