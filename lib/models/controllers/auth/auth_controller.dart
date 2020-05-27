import 'package:nippo/models/controllers/auth_controller/auth_state.dart';
import 'package:nippo/models/entities/user.dart';
import 'package:state_notifier/state_notifier.dart';

class AuthController extends StateNotifier<AuthState> with LocatorMixin {
  AuthController() : super(AuthState(user: null));

  void updateData({User user}) {
    print('AuthController -> updateData');
    state = AuthState(user: user);
  }
}
