import 'package:nippo/models/user.dart';
import 'package:state_notifier/state_notifier.dart';

class UserState {
  UserState({this.user});
  User user;
}

class UserController extends StateNotifier<UserState> with LocatorMixin {
  UserController() : super(UserState(user: null));

  void updateData({User user}) {
    print('UserController -> updateData');
    state = UserState(user: user);
  }
}
