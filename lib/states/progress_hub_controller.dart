import 'package:state_notifier/state_notifier.dart';

class ProgressHUDController extends StateNotifier<bool> {
  ProgressHUDController() : super(false);
  bool get saving => state;

  void update({required bool newState}) {
    state = newState;
    print('ProgressHUDState -> update to: $newState');
  }
}
