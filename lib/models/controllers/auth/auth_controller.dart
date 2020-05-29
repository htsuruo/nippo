import 'package:nippo/models/controllers/auth/auth_state.dart';
import 'package:nippo/models/entities/user.dart';
import 'package:nippo/models/repositories/auth_repository.dart';
import 'package:nippo/models/repositories/post_repository.dart';
import 'package:state_notifier/state_notifier.dart';

class AuthController extends StateNotifier<AuthState> with LocatorMixin {
  AuthController()
      : super(AuthState(user: User(uid: '0', email: 'sample@gmail.com')));

  Future<void> updateData() async {
    print('AuthController -> initState');
    if (await read<AuthRepository>().isLogin()) {
      final currentUser = await read<AuthRepository>().currentUser();
      state = state.copyWith(
        user: currentUser,
        posts: await read<PostRepository>().fetchByUser(uid: currentUser.uid),
      );
    }
  }

  Future<void> signOut() async => AuthRepository().signOut();
}
