import 'package:flutter/material.dart';

class StopwatchProvider extends ChangeNotifier {
  int _seconds = 0;
  int _minutes = 0;
  int _milliseconds = 0;

  int get getSeconds => _seconds;

  set setSeconds(int value) {
    _seconds = value;
    notifyListeners();
  }

  int get getMinutes => _minutes;

  set setMinutes(int value) {
    _minutes = value;
    notifyListeners();
  }

  int get getMilliseconds => _milliseconds;

  set setMilliseconds(int value) {
    _milliseconds = value;
    notifyListeners();
  }
}
