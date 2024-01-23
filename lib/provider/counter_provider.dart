import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 1;
  int get count => _count;

  increment() {
    _count++;
    notifyListeners();
  }

  decrement() {
    if (_count > 0) {
      _count--;
      notifyListeners();
    }
  }
}
