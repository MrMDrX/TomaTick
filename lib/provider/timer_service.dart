import 'dart:async';
import 'package:flutter/material.dart';

class TimerService extends ChangeNotifier {
  late Timer timer;

  static const double focusDuration = 1500; // 25 minutes
  static const double shortBreakDuration = 300; // 5 minutes
  static const double longBreakDuration = 900; // 15 minutes

  double currentDuration = focusDuration;
  double selectedTime = focusDuration;
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
      if (currentDuration > 0) {
        currentDuration--;
        notifyListeners();
      } else {
        handleNextRound();
      }
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
    currentState = 'FOCUS TIME';
    rounds = 0;
    goal = 0;
    isRunning = false;
    goalReached = false;
    notifyListeners();
  }

  void startTimer(double seconds) {
    selectedTime = seconds;
    currentDuration = seconds;
    notifyListeners();
  }

  void handleNextRound() {
    if (currentState == 'FOCUS TIME') {
      rounds++;
      if (rounds < 3) {
        currentState = 'BREAK TIME';
        currentDuration = shortBreakDuration;
      } else {
        currentState = 'LONG BREAK TIME';
        currentDuration = longBreakDuration;
      }
    } else if (currentState == 'BREAK TIME' ||
        currentState == 'LONG BREAK TIME') {
      currentState = 'FOCUS TIME';
      currentDuration = focusDuration;
      // Reset rounds if coming back from long break
      if (currentState == 'LONG BREAK TIME') {
        rounds = 0;
      }
    }

    // Increment goal if necessary
    if (goal < 12) {
      goal++;
    } else {
      goalReached = true;
      reset();
    }

    notifyListeners();
  }
}
