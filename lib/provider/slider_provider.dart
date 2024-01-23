import 'package:flutter/material.dart';

class SliderProvider with ChangeNotifier {
  double _value = 0.5;
  double get value => _value;

  void setValue(double val) {
    _value = val;
    notifyListeners();
  }
}
