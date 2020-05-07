import 'package:nippo/models/user.dart';
import 'package:state_notifier/state_notifier.dart';

class UserState {
  UserState({this.user});
  User user;
}

class UserController extends StateNotifier<UserState> {
  UserController() : super(UserState(user: null));

  void update({User user}) {
    state = UserState(user: user);
  }
}
