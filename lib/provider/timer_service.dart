import 'dart:async';

import 'package:flutter/material.dart';

class TimerService extends ChangeNotifier {
  late Timer timer;
  double currentDuration = 1500;
  double selectedTime = 1500;
  bool isRunning = false;

  void start() {
    if (isRunning) {
      return;
    }
    isRunning = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentDuration == 0) {
        timer.cancel();
        isRunning = false;
        return;
      }
      currentDuration--;
      notifyListeners();
    });
  }

  void pause() {
    timer.cancel();
    isRunning = false;
    notifyListeners();
  }

  void reset() {
    timer.cancel();
    currentDuration = selectedTime;
    isRunning = false;
    notifyListeners();
  }

  void startTimer(double seconds) {
    selectedTime = seconds;
    currentDuration = seconds;

    notifyListeners();
  }
}
