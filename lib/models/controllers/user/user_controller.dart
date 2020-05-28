import 'package:nippo/models/controllers/user/user_state.dart';
import 'package:nippo/models/repositories/user_repository.dart';
import 'package:state_notifier/state_notifier.dart';

class UserController extends StateNotifier<UserState> with LocatorMixin {
  UserController() : super(UserState(users: []));

  @override
  void initState() async {
    // TODO: implement initState
    state = UserState(
      users: await UserRepository().fetchAll(),
    );
  }
}
