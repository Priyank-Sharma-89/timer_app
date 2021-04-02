import 'package:flutter/material.dart';

class CountdownProvider extends ChangeNotifier {
  int _counter;
  bool _showText = true;

  int get getCounter => _counter;

  set setCounter(int value) {
    _counter = value;
    notifyListeners();
  }

  bool get getShowText => _showText;

  set setShowText(bool value) {
    _showText = value;
    notifyListeners();
  }
}
