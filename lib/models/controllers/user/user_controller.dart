import 'package:nippo/models/controllers/user/user_state.dart';
import 'package:nippo/models/repositories/user_repository.dart';
import 'package:state_notifier/state_notifier.dart';

class UserController extends StateNotifier<UserState> with LocatorMixin {
  UserController() : super(UserState(users: []));

  @override
  Future<void> initState() async {
    // TODO(tsuru): implement initState
    state = UserState(
      users: await UserRepository().fetchAll(),
    );
  }
}
