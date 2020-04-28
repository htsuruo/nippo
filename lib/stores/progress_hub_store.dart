import 'package:flutter/material.dart';

class ProgressHUDStore with ChangeNotifier {
  bool _saving = false;
  bool get saving => _saving;

  void update({bool newState}) {
    _saving = newState;
    notifyListeners();
  }
}
