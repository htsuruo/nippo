import 'package:nippo/models/controllers/user/user_state.dart';
import 'package:state_notifier/state_notifier.dart';

class UserController extends StateNotifier<UserState> {
  UserController() : super(UserState(users: null));
}
