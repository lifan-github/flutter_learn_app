import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier {
  int _count = 10;
  int get value => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}