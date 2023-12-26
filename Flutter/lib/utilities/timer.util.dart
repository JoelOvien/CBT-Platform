import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerModel extends StateNotifier<Duration> {
  TimerModel() : super(const Duration(minutes: 10));

  Timer? _timer;

  void startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      state = state - const Duration(seconds: 1);
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void resetTimer() {
    state = const Duration(seconds: 0);
  }
}

final timerProvider = StateNotifierProvider<TimerModel, Duration>((ref) {
  return TimerModel();
});
