import 'dart:async';
import 'package:flutter/material.dart';

class TimerService extends ChangeNotifier {
  late Timer timer;
  double currentDuration = 1500;
  double selectedTime = 1500;
  bool isRunning = false;
  int rounds = 0;
  int goal = 0;
  bool goalReached = false;
  String currentState = 'FOCUS TIME';

  void start() {
    if (isRunning) {
      return;
    }
    isRunning = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentDuration <= 0) {
        handleNextRound();
      } else {
        currentDuration--;
      }
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
    currentDuration = selectedTime = 1500;
    currentState = 'FOCUS TIME';
    rounds = goal = 0;
    isRunning = false;
    notifyListeners();
  }

  void startTimer(double seconds) {
    selectedTime = seconds;
    currentDuration = seconds;

    notifyListeners();
  }

  void handleNextRound() {
    if (currentState == 'FOCUS TIME' && rounds < 3) {
      currentState = 'BREAK TIME';
      currentDuration = 300;
      selectedTime = 300;
      rounds++;
      if (goal < 12) goal++;
    } else if (currentState == 'BREAK TIME') {
      currentState = 'FOCUS TIME';
      currentDuration = 1500;
      selectedTime = 1500;
    } else if (currentState == 'FOCUS TIME' && rounds == 3) {
      currentState = 'LONG BREAK TIME';
      currentDuration = 900;
      selectedTime = 900;
      if (goal < 12) {
        goal++;
      } else {
        goalReached = true;
        reset();
        notifyListeners();
        return;
      }
      rounds++;
    } else if (currentState == 'LONG BREAK TIME') {
      currentState = 'FOCUS TIME';
      currentDuration = 1500;
      selectedTime = 1500;
      rounds = 0;
    }
    notifyListeners();
  }
}
