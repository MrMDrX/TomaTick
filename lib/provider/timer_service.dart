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
      goal++; // Increment the goal every time a focus round is completed

      if (goal >= 12) {
        // Check if goal is reached after 12 rounds
        goalReached = true;
        notifyListeners();
        reset();
        return;
      }

      currentState = 'BREAK TIME';
      currentDuration = shortBreakDuration;
    } else if (currentState == 'BREAK TIME') {
      currentState = 'FOCUS TIME';
      currentDuration = focusDuration;
    } else if (currentState == 'LONG BREAK TIME') {
      currentState = 'FOCUS TIME';
      currentDuration = focusDuration;
      rounds = 0; // Reset rounds after long break
    }

    // Handle long breaks after every 4 focus sessions
    if (rounds % 4 == 0 && rounds > 0) {
      currentState = 'LONG BREAK TIME';
      currentDuration = longBreakDuration;
    }

    notifyListeners();
  }
}
