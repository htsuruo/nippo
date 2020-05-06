import 'package:flutter/material.dart';

class BottomNavBarState with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void change({int index}) {
    _currentIndex = index;
    print('selected page is $_currentIndex');
    notifyListeners();
  }
}
